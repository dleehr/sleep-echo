import time
import sys

loops, delay, message = int(sys.argv[1]), int(sys.argv[2]), sys.argv[3]

for i in range(loops):
  print(i, message)
  time.sleep(delay)

print('Finished', message)

