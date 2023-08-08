---
date: "2023-07-31"
author: "Airscript"
title: "Building Anally Fast Stuff"
categories: ["open source", "esolangs"]
tags: ["airscript", "open source", "esolangs"]
images: ["/images/cover-analscript.png", "/logo-open-graph.png"]
summary: "A modern approach for writing anally fast stuff with Analscript."
---

![name](/images/cover-analscript.png#center)

## Introduction
Hey there! I am Francesco known as Airscript on the web.  
Today I want to share with you my first experience building a joke [esoteric programming language][esolangs-org]: [Analscript](https://github.com/airscripts/analscript).  
We will go through how I have started, what I have learned and how I have realized all of this.

## History Behind The Joke
All started the day I've decided to give my GitHub sponsors some perks.  
One of those perks is the possibility to have their usernames written in a large variety of esolangs.  
So, when a new sponsor came up, I had to ask for which esolang the username would be written it in...and then a wild AnalLang appeared.  
Yes, you heard it right: [AnalLang][anallang].  

## The Dad Of Analscript
I jumped right into the action and read about AnalLang onto the [bible of esolangs][esolangs].  
The thing that jumps right in my face, during the lecture, is that the project got deleted. And with it also its creator.  
All gone. Everything.  
I tried to recover it from [npm][npm-js] but nothing was working, even if I had found the original project.  
I took it personally and decided to make a new AnalLang, something that had everything his father had but with a modern approach.  
And that is how my journey begins.  

## Anal-yzing The Project
The first thing that I did was to learn how AnalLang worked, or at least how was intended to work originally.  
It is very simple: you convert the characters to their corresponding [ASCII][ascii] code and then simply write N times this emoji combination: 🍑🍆.  
This is, basically, AnalLang. Simple, right?

## Writing Down The Foundation
Now that I had a good idea about how everything worked, I just jumped out making some decisions.  
The goal here was to give everything daddy had, even the basic runtime he used: [Node.js][node-js].  
I've scaffolded a project with the latest LTS as of this time, v18, and jumped right in making the standard library.  
The first thing I've worked on were the two main functions: **anallify** and **stringify**. Respectively one for transforming string to anal content and the other to reverse them.  
Once done this, I was literally at a good point with the language.

## Exposing Everything
Once I had the standard library, I needed to choose first how users could consume this language.  
I thought to start with two simple ways: a CLI and a simple import as a libary.  
For the latter, it was really easy: I have just exposed the modules I wanted through the use of [ES Modules][javascript-modules].  
The CLI was a little bit more interesting to do.  
Did you know that you can add a bin key into your package.json and that just makes a binary for your lib? It is literally amazing.

```json
{
  "bin": {
    "analscript": "analscript.js"
  }
}
```
> With this simple line, when bundling the project, you will have a fantastic binary to run everything from.  

Once done this, I had to choose the commands to expose and everything was set.  
At the end I've chosen to expose anallify and stringify for doing [JIT][jit] encoding and decoding for various use cases. Like making stuff in a simple pipeline for example.  
Then I've added two special commands that gave us the power to use .anal files: run and compile.  
Compile just compiles everything you give it into an .anal compliant file. Run...you can imagine or try it by yourself.  

## Wrapping The Whole Package
At the end of the day, I wanted to give some robustness to everything.  
My main goals were: testing, documentation, listing, automation and inclusion.  
- **Testing**: this one was really simple to accomplish and I have just used vitest for writing all the unit tests.  
With the help of [@mateonunez][mateo-nunez], we also improved code coverage of the whole project.  
- **Documentation**: with this step I am still working. I have decided to make use of [Docusaurus][docusaurus], just to keep everything inside JavaScript ecosystem and of course to keep it comprehensible for future Analscripters.
- **Listing**: the world had to knew who is the new boss in the city. For this reason, I have added [Analscript to esolangs.org][esolangs-analscript].
- **Automation**: who doesn't love automation? Analscript for sure loves it. Thanks to [CircleCI][circleci] I was able to setup a fantastic workflow for running automated tests. And this closes the Circle...CI.  
- **Inclusion**: what if I don't know how to run this project on my machine or am I having problems with it? Simple: I left a [container image][docker-hub-analscript] ready for you. Nothing more to say.  

## What I Have Learned
After creating Analscript I learned something valuable, beside all the technical knowledge that I gathered from it: even the simplest project can be valuable if you give it the possibility to do it.  
So just do what you want to do! Even if it is a simple Hello World.  
You can always learn something new and obtain a lesson from it.

## Conclusion
So wrapping things up, we have seen the history behind the idea, what was AnalLang, how I've built everything and the main aspects that I have focused on when completing the project.  
In the end everything has a lesson so why don't just share it with you too?
I hope that this post was fun and informative for you. I will see you in undefined days. Thank you kindly.

## Share Support
If you have liked this post, just come and tell me!  
Are you too shy for doing this? No problem. Just visit [airscript.it][airscript-it] and share your support following me on your preferred social platform.  
If you want to make me even more happier, just follow, share or star me and my projects on [GitHub][github].

[node-js]: https://nodejs.org
[npm-js]: https://npmjs.com
[circleci]: https://circleci.com
[docusaurus]: https://docusaurus.io/
[airscript-it]: https://airscript.it
[esolangs-org]: https://esolangs.org
[github]: https://github.com/airscripts
[ascii]: https://en.wikipedia.org/wiki/ASCII
[mateo-nunez]: https://github.com/mateonunez
[anallang]: https://esolangs.org/wiki/AnalLang
[jit]: https://en.wikipedia.org/wiki/Lean_manufacturing
[esolangs-analscript]: https://esolangs.org/wiki/Analscript
[esolang]: https://esolangs.org/wiki/Esoteric_programming_language
[docker-hub-analscript]: https://hub.docker.com/r/airscript/analscript
[javascript-modules]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules
