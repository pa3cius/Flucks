# BaseState
- Abstract parent class for all states
- Extend from this class when creating a new state
## Attributes
- `@onready state_machine : StateMachine` parent state machine of a state.
- `@export parent : Node` 
 - parent node of the state machine. Each state should a state for one of these nodes
## Methods
- `set_parent(parent_instance : Node) -> void:` 
 - Sets the parent instance of a node.
 - Can also be done using the @export annotation.
 - Used when a new node is created programatically, and the parent instance cannot be set within the editor.
- `enter_state() -> void:`
 - Is called when the current state is being entered
- `exit_state() -> void:`
 - Is called when the current state is being exited
- `proccess_state(delta : float) -> void`:
 - Called every frame to process the state