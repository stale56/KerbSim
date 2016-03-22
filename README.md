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

RemoteTech ---I will probably make it so you don't need this over the weekend. I just need to remove one part antenna on the vessel.




TO USE THIS:

Get all of the .m files and enginePerformance.csv and put them in a folder on your MATLAB path. Then run KerbSim.m in MATLAB. Boom. That's it.

I have this set up so you can easily change your desired ascent profile. Just edit the fnAscentProfile.m function. If you change anything with the variables the function takes, make sure you the line that calls fnAscentProfile.m in Kerbsim reflects those changes.




If you want to try out the vessel for yourself, just move the craft file to your saves\GAMENAME\Ships\VAB folder




Have fun! If you have any questions, please send me a PM on reddit /u/stale56

You could probably send me questions or comments over github, I'm not too familiar with github, so I don't actually know.


Wooh! Teamwork makes the dream work!
