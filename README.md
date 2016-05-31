# Posner-Paradigm
replicates classic Posner experiment

For this project, your task is to replicate a generalized version of the Posner paradigm. In essence, you will measure the speed of the “attentional spotlight” in the vertical versus horizontal directions. You need to create a program that allows you to gather data on reac- tion times in the Posner paradigm as described in the preceding sections. Most of the par- ticular implementation is up to you (the nature of the cue, specific distances, etc.). However, be sure to implement the following:
• Cue and target must appear in one of 16 possible positions. See, for example, Figure 7.4.
• Make sure you have an equal number of valid and invalid trials. [If the trial is valid,
the target should appear in the position of the cue. If the trial is invalid, the target
position should be picked randomly (minus 1, the position of the cue).]
• Choose two temporal delays between cue and target: 100 ms and 300 ms. Make the
delay an experimental condition.
• Collect data from 80 trials per spatial location of the cue (so that you have 20 for each
combination of conditions: Valid/invalid, delay1/delay2). This makes for a total of 1280
trials. But they will go very, very quickly in this paradigm.
• Make sure that the picking of condition (valid/invalid, delay1/delay2, spatial location
of cue) is random.
• After collecting the data, answer the following questions:
1. Is there a difference in reaction times for valid versus invalid trials? (t-test)
2. Is there a difference in reaction times for different delays? (t-test)
3. Does the distance between target and cue matter? For this, use only invalid trials and
plot reaction time as a function of
  a. Total distance of cue and target
  b. Horizontal distance of cue and target 
  c. Vertical distance of cue and target
4. Related to this: Is there a qualitative difference in the slope of these lines? Is the scanner faster in one dimension than the other?
5. What is the speed of the attentional scanner? How many (unit of your choice, could be inches) does it shift per millisecond?
