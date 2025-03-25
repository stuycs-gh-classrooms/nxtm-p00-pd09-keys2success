[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/rXX1_Uiw)
## Project 00
### NeXTCS
### Period: 9 
## Name0: Miranda Chen
## Name1: Ethan Ma
---

This project will be completed in phases. The first phase will be to work on this document. Use github-flavoured markdown. (For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) )

All projects will require the following:
- Researching new forces to implement.
- Method for each new force, returning a `PVector`  -- similar to `getGravity` and `getSpring` (using whatever parameters are necessary).
- A distinct demonstration for each individual force (including gravity and the spring force).
- A visual menu at the top providing information about which simulation is currently active and indicating whether movement is on or off.
- The ability to toggle movement on/off
- The ability to toggle bouncing on/off
- The user should be able to switch _between_ simluations using the number keys as follows:
  - `1`: Gravity
  - `2`: Spring Force
  - `3`: Drag
  - `4`: Electric charge
  - `5`: Spring + electric charge + gravity


## Phase 0: Force Selection, Analysis & Plan
---------- 

#### Custom Force: Electric charge
### Forumla
What is the formula for your force? Including descriptions/definitions for the symbols. (You may include a picture of the formula if it is not easily typed.)

PVector F = K * [(abs(q1) * abs(q2)) / r^2 ]*(q1.x-q2.x, q1.y-q2.y).normalize()            

### Custom Force
- What information that is already present in the `Orb` or `OrbNode` classes does this force use?
  - distance between orbs

- Does this force require any new constants, if so what are they and what values will you try initially?
  - Yes, the charge variables and K

- Does this force require any new information to be added to the `Orb` class? If so, what is it and what data type will you use?
  - float charge = random(-10,10)
  - float K = 9*10^9

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - Yes, the force is calculated based on the interaction between orbs

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - Converting elementary electron charge (-10,10) to coulombs
  - Converting coulombs to PVector
  - normalized vector from q1.center to q2.center

--- 

### Simulation 1: Gravity
Describe how you will attempt to simulate orbital motion.
Centripetal acceleration?? (bc fixed orb)\
Idea 1: Forces for each non-fixed orb will be calculated by using the current orb and the fixed orb\
Idea 2: Forces calculated from current orb to orb.next so all orbs go in a circle + a force to the fixed orb so it doesn't fly away from the fixed orb

--- 

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running.  

Lab w/o gravity

--- 

### Simulation 3: Drag
Describe what your drag simulation will look like. Explain how it will be setup, and how it should behave while running.

Screen divides into the half with drag and the half without. All orbs line up vertically at the left (side without drag) then are all assigned a random velocity to the x direction heading to the drag area. It should show that the drag is slowing down the orbs

--- 

### Simulation 4: Electrostatic force
Describe what your Custom force simulation will look like. Explain how it will be setup, and how it should behave while running.

Startup: Each orb will be added a new instance variable with randomly generated charge\
The force between each orb is calculated. (opposites attract, likes repel) -> need to check whether orbs are attracting or repelling

--- 

### Simulation 5: Gravity + Spring + Charge
Describe what your combination simulation will look like. Explain how it will be setup, and how it should behave while running.

Spring: all orbs will have springs attached to one another (spring force applied)\
Gravity: field gravity or gravity between orbs? (I think gravity between orbs)\
Charge: Charged orbs will line up at the border (fixed), orbs will spawn in the middle (not fixed) so that when it gets close to the border it will either attract to one of the orbs at the border or be repelled

