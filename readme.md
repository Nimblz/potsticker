# Potsticker: a modern Object Browser

## What is Potsticker?
Potsticker is a modern Object Browser. Potsticker uses LPGhatguy's [dumpling](https://github.com/LPGhatguy/dumpling) to generate up-to-date user-authored api docs. Potsticker is powered by the [Rodux](https://github.com/Roblox/rodux) state management library and the [Roact](https://github.com/Roblox/roact) view management library to ensure stability and performance.

## Why Potsticker?
When working in Roblox, it's nice to have quick reference to classes and their members. The Object Browser was once a vital utility for quick reference. As of late the Object Browser has fallen out of favor, being succeeded by the Api Reference section of the Dev Hub. This is not an ideal solution, however. If, for instance, you just want to know how a specific method is spelled, or what the arguments to a datatype are, the Dev Hub necesitates opening a web browser, waiting for pages to load as you navigate, then finding the information you want on the page. The Dev Hub does have a search feature, but it seems more likely to take you to a redirect page than the actual api member, increasing wait time further as you have to wait for two pages to load. The alternative is the Context Help view, which attempts to be a context sensitive reference utility, but ends up being useless as it's just the Api Reference page for your selected class. It, being ripped straight from the Reference page, is far too verbose, making you scroll miles just to reach the actual members you want (that is if you dont accidentally click something and switch the page). In addition to that, the style rules of the Dev Hub do not account for how small the Context Help widget is when docked to the side of studio, leading to a wierd looking layout where things overflow under the right side of the widget.

This is why we made Potsticker. Potsticker is a modern PluginWidget Object Browser that attempts to capture the simple, straight-to-the-point feeling of the original. Potsticker is intentionally minimal and compact in its layout, so you can dock it to the side or corner of studio, and it remains perfectly readable and functional. Potsticker includes a search bar, and helpful user-authored descriptions for select api members.