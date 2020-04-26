import tensorflow as tf
# import urllib  # This does the same thing: urllib will be called url.
import numpy as np
import os

# This basically means it'll run the code immediately without running extra things off to the side (e.g. constructing a graph, etc.)
tf.enable_eager_execution()


with open("movie_lines.txt", "rb") as fil:
    data = []
    for x in fil.readlines():
        # x = x.encode('utf-8')
        # print(x)
        # hi = 
        # print(hi)
        data.append(str(x[x.rfind(" +++$+++ ".encode())+9:].strip()))
        # print(data)
data = '\n'.join(data)

uni = set(data)
uni = sorted(uni)  # This sorts the list.

'''
Now, we need to create data structures from which we can access the char to int and vice versa.
'''
obj = {char: num for num, char in enumerate(uni)}
# Okay, so enumerate will give each character its position in the list uni. So, "\n" would get 0, "\r" would get 1, and so on.
# From there, we are creating a dictionary, in which we can call a certain character, and it will return its vectorized value.
# print(obj["\n"]) # This returns 0.
# print(obj["\r"]) # This returns 1.

# This is an array of all the characters; the indicies correspond to the desired character.
arr = np.array(uni)
text_stuff = np.array([obj[char] for char in data])
# print(arr[0]) # This returns "\n" (it will appear as an enter, not the characters "\n" itself).
# print(arr[1]) # This returns "\r".
'''
Now we need to prep the data for the RNN. 
'''
seqLEN = 50  # This is the maximum length of an input.
# This returns how many times the seqLEN will evenly go into the data.
numOfExams = len(data) // seqLEN

# This slices up all the data into a Dataset which tensorflow can use.
charData = tf.data.Dataset.from_tensor_slices(text_stuff)

# This batches the sequences we need together, dividing the data into portions of size seqLEN+1.
seq = charData.batch(seqLEN+1, drop_remainder=True)


def spli(ch):  # This function will return the input vector and the output vector; the objective of the NN is to output the next character in the sequence.
    inpu = ch[:-1]
    out = ch[1:]
    return inpu, out


data = seq.map(spli)  # This will parse the data for each batch.

sz = 64  # This sets the batch size.
# Given the batch size, this'll output how many steps are necessary to take.
steps = numOfExams // sz
# The is an additional parameter necessary for tensorflow; for now, we can ignore it.
buffer = 10000

# This will mix the data.
data = data.shuffle(buffer).batch(sz, drop_remainder=True)

voSZ = len(uni)  # This is the number of characters types within the text.

embDIM = 256  # Here we set the embedded dimensions.

rnnNUM = 1024  # And now we set the number of RNN units.
'''
Now we set up the model...
'''
if tf.test.is_gpu_available():
  # This checks if it can use CuDNNGRU, which is basically a super speedy version of everything. Else, it is done by hand.
  rnn = tf.keras.layers.CuDNNGRU
else:
  import functools
  rnn = functools.partial(
      tf.keras.layers.GRU, recurrent_activation='sigmoid')


# This function will basically return a ready-to-run model of the RNN
def build_model(vocab_size, embedding_dim, rnn_units, batch_size):
  model = tf.keras.Sequential([
      tf.keras.layers.Embedding(vocab_size, embedding_dim,
                                batch_input_shape=[batch_size, None]),
      rnn(rnn_units,
          return_sequences=True,
          recurrent_initializer='glorot_uniform',
          stateful=True),
      tf.keras.layers.Dense(vocab_size)
  ])
  return model


model = build_model(  # This calls the function.
    vocab_size=len(uni),
    embedding_dim=embDIM,
    rnn_units=rnnNUM,
    batch_size=sz)

# This gives it inputs.
for input_example_batch, target_example_batch in data.take(1):
  example_batch_predictions = model(input_example_batch)

model.summary()  # This should print out a summary of the model.
'''
Training time!
'''


# This is the loss function we are trying to optimize.
def loss(labels, logits):
  return tf.keras.losses.sparse_categorical_crossentropy(labels, logits, from_logits=True)


# This will call the function.
example_batch_loss = loss(target_example_batch, example_batch_predictions)

model.compile(  # This compilers, or further prepares, the model.
    optimizer=tf.train.AdamOptimizer(),
    loss=loss)


# Directory where the checkpoints will be saved
checkpoint_dir = './training_checkpoints'
# Name of the checkpoint files
checkpoint_prefix = os.path.join(checkpoint_dir, "ckpt_{epoch}")

checkpoint_callback = tf.keras.callbacks.ModelCheckpoint(
    filepath=checkpoint_prefix,
    save_weights_only=True)

# The is for epochs, or how many times the algorithm will look through the data; the higher it is, the better.
ep = 100
# history = model.fit(data.repeat(), epochs=ep, steps_per_epoch=steps, callbacks=[
#                     checkpoint_callback])  # This will train the model

# After it's trained, this will build the model.
model = build_model(voSZ, embDIM, rnnNUM, batch_size=1)
# This will load the weights we trained.
model.load_weights(tf.train.latest_checkpoint(checkpoint_dir))
model.build(tf.TensorShape([1, None]))
model.summary()  # This will show you the logistics of the model.
'''
Finally, text generation!
'''


def generate_text(start):  # This is the fancy function we'll use.
  start = "\n" + start
  num = 100  # This is how many characters we should generate.

  # This converts the inputted string to numbers (vectorising).
  inp = [obj[s] for s in start]
  inp = tf.expand_dims(inp, 0)

  gene = []  # This is where the generated text will be stored.

  # Low temperatures result in more predictable text; higher temperatures result in more surprising text.
  temp = 1.0

  # Here, the batch size is one.
  model.reset_states()
#   for i in range(num_generate):
  while (True):
      pred = model(inp)
      pred = tf.squeeze(pred, 0)  # This removes batch dimensions.

      pred = pred / temp
      pID = tf.multinomial(pred, num_samples=1)[-1, 0].numpy()
      # This uses a multinomial distribution to predict the word returned by the model

      # It'll then go on to the next RNN given the parameters generated.
      inp = tf.expand_dims([pID], 0)

      gene.append(arr[pID])  # It adds it onto the generated string.
      if (arr[pID] == "\n" and len(gene) != 1):
        if (len(gene) == 2 and gene[0] == "'"): 
          continue
        if (len(gene) == 2 and gene[0] == '\r'):
            continue
        if (''.join(gene).strip() == '<br>'):
            continue
        else:
            break
#       print(gene)

  return (''.join(gene))  # And we return it all!
