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


MODS REQUIRED TO USE THE ATTACHED VESSEL:

kOS        ---This is just so you can program your own ascent profile to the craft, to compare the accuracy of my simulation

RemoteTech is optional. I have 2 craft files: one without any antenna, and one with an RT antenna.




TO USE THIS:

Get all of the .m files and enginePerformance.csv and put them in a folder on your MATLAB path. Then run KerbSim.m in MATLAB. Boom. That's it.

I have this set up so you can easily change your desired ascent profile. Just edit the fnAscentProfile.m function. If you change anything with the variables the function takes, make sure you the line that calls fnAscentProfile.m in Kerbsim reflects those changes.




If you want to try out the vessel for yourself, just move the KerbSimVessel(RT).craft file to your saves\GAMENAME\Ships\VAB folder.

If you have RT, make sure you grab the one with RT in the title.




Have fun! If you have any questions, please send me a PM on reddit /u/stale56

You could probably send me questions or comments over github, I'm not too familiar with github, so I don't actually know.


Wooh! Teamwork makes the dream work!
