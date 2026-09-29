---
layout: essay
title: "Your fleet, in view"
date: 2026-09-28
canonical_url: "https://oblinger.github.io/dictamux-site/essays/your-fleet-in-view/"
---
{% raw %}
Five Claude sessions, five jobs, all running right now. One is rewriting the auth middleware. One is running the test suite and will have something to say in a minute. One is waiting on a question I have not seen yet. I have not typed to any of them since this morning.

That is a normal Tuesday now, and I want to talk about the part of it that nobody writes about, which is not the agents. It is me.

## The cost is the switch, not the typing

Running one coding agent is easy. You watch it, you answer it, you type. Running five is a different job, and the thing that makes it hard is not the volume of work; the agents do the work. It is that every time one of them needs you, you have to find out, go there, load the whole context of what that session was doing, say the one thing, and come back to whatever you were reading. Each of those is a context switch, and context switches are the only thing in this setup that costs *you* anything.

So the question that actually matters when you run a fleet is: how small can each switch be made? Not how fast the agents are. How little of my head each interruption takes.

Two things turned out to shrink it more than everything else combined. One of them is free and takes a minute to install. The other one I built because the first one was not enough.

## First: know who needs you

The first thing is to have every agent's state in front of you all the time, without going anywhere. Working. Done. Waiting on a question. One glance at a status line and I know which of the five wants me and which are fine.

If you have seen peon-ping, you have seen half of this: the agent tells you, out loud, when it needs you. People loved it, and I think the reason is that it is the first tool that treated the operator's attention as the scarce thing. The status line is the same idea with the sound turned off and all five agents on the same strip. It is a small plugin for Claude Code; it installs from the marketplace, it needs no app, and it has nothing to do with dictation. If you run more than one session and you install nothing else from this post, install that. It will make the switches shorter on its own.

But it only solves the *knowing*. You still have to go there.

## Then: don't go there

The second thing is the one I could not find anywhere, so it became an app. It is the ability to say something to an agent by name, from wherever I am, without leaving what I am doing.

I am reading what the test runner just came back with. Pane three, my attention is fully in it. And while I am reading it, I say: *api, take the auth middleware and pull the token refresh into its own function.* The text lands in the api pane. My cursor never moved. I never stopped reading the test output. The switch that used to cost me a minute of reorienting cost me one sentence, spoken, and no part of my head.

That is what DictaMux is: a standing voice channel to the whole fleet that is never switched off. Not push-to-talk into the session you are focused on; Claude Code already has that, it is free, and for one session it is the right answer. This is the other thing. It is addressed. It goes where you sent it. And it runs both ways, because the status line is the same channel coming back.

## Say it wrong, then fix it

The part I did not expect to matter turned out to matter most. When you talk to five agents instead of typing to one, you misspeak. You name the wrong one. You start a sentence and realize halfway through that you mean the method, not the function. With typing you just backspace. With most dictation the words are already gone.

So the buffer is yours until you send it. *Scratch that, make it a method.* *No, the other pane.* You edit what you said, by voice, before it lands, and the agent only ever sees the finished thought. Of everything in this setup, this is the one thing I have not seen anywhere else, and it is the thing that makes talking to a fleet feel like directing rather than dictating.

## The operating model

Put the three together and you get an operating model that I have been living in for a year and that I think a lot of people are about to arrive at whether they want to or not:

- Every agent's state is in view, always. You never go looking.
- You speak to the one you mean, from wherever you are. You never go there.
- What you say is yours until you send it. You never send the wrong thing.

The agents are not the interesting part. The interesting part is that with those three, my attention stays where I put it, and the fleet comes to me.

## Who this is for, and who it is not

If you run two or more agent sessions a day on an Apple-silicon Mac, this is for you, and the install is two steps: the plugin from the marketplace, then the app.

If you run one session, you do not need any of this. Use Claude Code's own voice mode; it is free and it is good. Come back when you have three.

## Where it is

The status plugin is free and does not need the app: `PLUGIN_INSTALL_LINE`. The app is at `PAGE_URL`. I read every question at `QUESTIONS_URL`, and if something breaks, the app writes a diagnostics file you can attach that has none of what you said in it.

I have been the only user of this for a year. That ends now, and I would like to hear what it does on a machine that is not mine.
{% endraw %}
