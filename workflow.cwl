cwlVersion: v1.0
class: Workflow
label: sleep-echo-scatter
doc: Sleep echo scatter
requirements:
  - class: ScatterFeatureRequirement
inputs:
  loops: int
  delay: float
  messages: string[]
outputs:
  outputs:
    type: File[]
    outputSource: sleep_echo/output
steps:
  sleep_echo:
    run: sleep-echo.cwl
    requirements:
    - class: ResourceRequirement
      coresMin: 1
      ramMin: 100
    scatter: message
    in:
      loops: loops
      delay: delay
      message: messages
    out:
      - output
