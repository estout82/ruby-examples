
import {enter, leave, toggle} from "el-transition";

// enter
enter(element)
.then(() => {
  doSomething(); // this is ran when the transition is complete
});

<div id="dropdown-menu" class="menu hidden"
    data-transition-enter="transition ease-out duration-100" // these are applied for the whole enter transition
    data-transition-enter-start="transform opacity-0 scale-95" // this is where it starts
    data-transition-enter-end="transform opacity-100 scale-100" // this is where it ends
    data-transition-leave="transition ease-in duration-75"
    data-transition-leave-start="transform opacity-100 scale-100"
    data-transition-leave-end="transform opacity-0 scale-95"
>
  some stuff
</div>

// leave
leave(element)

// togggle
toggle(element)