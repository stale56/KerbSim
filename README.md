# KerbSim
A KSP simulation for MATLAB that allows the user to optimize their launch profile.
This simulation makes several assumptions:

  -The rocket is a particle, with the only forces being:
  
      >Gravity

      >Thrust

      >Drag

  -All heading changes are instantaneous

  -The launch profile is equatorial

  -The drag is acting on a circlular, frontal cross section 

  -Probably a few more

  
I did this to approximate the flight path of a rocket in KSP.

I use Newton's second law to determine the acceleration on the vessel, then a 1st order Taylor approximation to get the velocity, and a 2nd order approximation to get the position (everything in X and Y components).


#MODS REQUIRED TO USE THE ATTACHED VESSEL:

kOS        ---This is just so you can program your own ascent profile to the craft, to compare the accuracy of my simulation

RemoteTech is optional. I have 2 craft files: one without any antenna, and one with an RT antenna.




#TO USE THIS:

Get all of the .m files and enginePerformance.csv and put them in a folder on your MATLAB path. Then run KerbSim.m in MATLAB. Boom. That's it. As it is, it just launches the vessel straight up to an AP of 150km, then it finds the mass remaining when it gets there, the dV remaining, the velocity at AP, the dV remaining after circularizing


I have this set up so you can easily change your desired ascent profile. Just edit the fnAscentProfile.m function. If you change anything with the variables the function takes, make sure you the line that calls fnAscentProfile.m in Kerbsim reflects those changes.




If you want to try out the vessel for yourself, just move the KerbSimVessel(RT).craft file to your saves\FILENAME\Ships\VAB folder.

If you have RT, make sure you grab the one with RT in the title.




Have fun!

You could probably send me questions or comments over github, I'm not too familiar with github, so I don't actually know. Otherwise, just PM me on reddit: /u/stale56


Wooh! Teamwork makes the dream work!
