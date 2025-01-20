# TimeFlowComponent
- A component that controls the flow of time for a specific node.
## Attributes
- `time_flow : flow` 
 - Controls the speed at which time flows for a current node.
 - Used by a parent node to modify all actions with a speed and duration.
 - emits the `time_flow_changed` signal when changed.
 