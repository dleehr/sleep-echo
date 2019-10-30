cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: DockerRequirement
    dockerPull: 'python:3.6'
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
      - entryname: sleep-echo.py
        entry: |
          import time
          import sys
          loops, delay, message = int(sys.argv[1]), float(sys.argv[2]), sys.argv[3]
          for i in range(loops):
            line = '{}: {}'.format(i, message)
            print(line)
            print(line, file=sys.stderr)
            sys.stderr.flush()
            time.sleep(delay)
          print('Finished', message)
baseCommand: python
arguments: [sleep-echo.py]
inputs:
  loops:
    type: int
    inputBinding:
      position: 1
  delay:
    type: float
    inputBinding:
      position: 2
  message:
    type: string
    inputBinding:
      position: 3
stdout: $(inputs.message + '.txt')
outputs:
  output:
    type: File
    outputBinding:
      glob: $(inputs.message + '.txt')

