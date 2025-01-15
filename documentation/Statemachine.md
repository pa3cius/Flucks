# State machine
 - A generic state machine that is used by all entities with multiple mutually exclusive states.
## Attributes
 - `current_state : Basestate` 
  - Holds the current state of the state machine
 - `parent_enum : enum` 
  - An enum that holds all the possible states of the parent  entity. Annotated using the `@onready` annotation, becomes not null when the entity is loaded in
 - `parent_state_dict : dict`
  - Translates between the enum, and the `StringName` of the state. This is done to avoid using strings as names directly
## Methods
 - `_ready() -> void`
  - Loops through all the states of the state machine, and sets itself as the parent.
 - `transition_to_state(state_enum) -> void`
  - Takes a `state_enum` value as a parameter, and sets it as the current state. It also informs the current state that a switch is occuring.
 - `set_initial_state(state_enum) -> void`
  - Sets the inital state of the state machine. Accepts the a state enum value as a parameter.
 - `transition_to(new_state: String) -> void`
  - Transitions to a new state, notifies the state it is exiting, and the state it is entering
 - `_process(delta) -> void`
  - Called every frame, notifies the current state that a frame has occured.
