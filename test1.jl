using Blink

w = Window();
title(w, "1st App with Blink");
body!(w, "Hello World");
# progress(w, [0, 1.0]);
# flashframe(w, true);

handle(w, "press") do args
    @show args
end

body!(w, """<button onclick='Blink.msg("press", "HELLO")'>go</button>""");