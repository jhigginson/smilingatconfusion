# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["Elliott Smith", "The Beatles", "Radiohead", "Sun Kil Moon"].each do |artist|
  Artist.find_or_create_by_name(artist)
end

["Roman Candle", "Self Titled", "Either/Or", "XO", "From A Basement On The Hill", "Figure 8", "New Moon"].each do |album|
  Album.find_or_create_by_name(album)
end

standard_tuning = Tuning.find_or_create_by_name("Standard E")
standard_tuning.update(notes: "EADGBE")
dropd_tuning = Tuning.find_or_create_by_name("Drop D")
dropd_tuning.update(notes: "DADGBE")
standard_d_tuning = Tuning.find_or_create_by_name("Standard D")
standard_d_tuning.update(notes: "DGCFAD")
doubledropd = Tuning.find_or_create_by_name("Double Drop D")
doubledropd.update(notes: "DADGBD")
weird_tuning = Tuning.find_or_create_by_name("Clementine Tuning")
weird_tuning.update(notes: "CGCEAD")

user = User.find_or_create_by_name("fakeuser")

clementine = Tab.new(title: "Clementine",
                                notes: "Make sure to listen to get the strumming right",
                                body: %q{
intro (X2)
D-(4)--------------
A--3----3----3-----
E--2--0h1--0h1-----
C--0----0----0--u3-
G--0----0----0-----
C--0----0----0-----

verse
D-------------------------------------------
A--3------------------3--2--0---------3-----
E--0----------------------------------0-----
C--0------------------------------3---0-u3--
G--0------------------------------3---0-----
C--0----------------------------------0-----
   they're waking you up to close the bar

D---------------------------------------------------------
A--3-------------------3----2----0------------------------
E--0------------------------------------------------------
C--0------------------------------------3-------2---------
G--0------------------------------------3-------4---------
C--0--------------------------------------------4-----3\2-
   streets wet you can tell by the sound of the cars

D----------------------------------------
A--3---------------3--2----0-----3-------
E--0-----------------------------0-------
C--0--------------------------3--0--u3---
G--0--------------------------3--0-------
C--0-----------------------------0-------
   the bartender's singin' clementine

D------------------------------------------
A--3-------------------3-----2---0---------
E--0---------------------------------------
C--0-------------------------------3--2----
G--0-------------------------------3--4----
C--0----------------------------------4----
   while he's turnin' around the open sign

chorus
D----------------------------2--0-----  intro riff X1
A--5--7----5------5--2-2h3p2-------3--
E--5--------------5--1-------------2--
C--5----------8\7-5--2-------------0--
G--5--------------5--0-------------0--
C--5--------------5--0-------------0--
      dreadful sorry,        clementine

bridge
D-------------------------------------------------------------
A--3--------------------/5---------7---5--7---/3-----3--2h3---
E--5--------------------/7---------0------0---------h2--------
C--0---------------------0----------------0---------h2--------
G--5--------------------/7----------------0---------h2--------
C--5--------------------/7----------------0---------h2--------
   though your still her man, it's been a long time gone

D--/7---------------5----------------/7----------------5-------------------------
A--/5-----------------------\3--2h3--/5--------------------2---------------------
E--/5-----------------------\2-------/5--------------------1---------------------
C--/5-----------------------\2-------/5--------------------2---------------------
G--/5-----------------------\2-------/5--------------------0---------------------
C--/5-----------------------\2-------/5--------------------0---------------------
    maybe the whole thing's wrong    what if she thinks so but just didnt say so

verse 2 (played the same as the first)

you drink yourself into slo-mo
made an angel in the snow
anything to pass the time
and keep that song out of your mind

coda
D--/10------------8---\7-----------5--------------------------------
A--/8-----------------\5-----------------7--5--3------------3---2h3-
E--/8-----------------\5-----------------------0-----------h2-------
C--/8-----------------\5-----------------------0-----------h2-------
G--/8-----------------\5-----------------------0-----------h2-------
C--/8-----------------\5-----------------------0-----------h2-------
    oh, oh my darlin  oh, oh my darlin,  oh my darlin clementine


D----------------------------2--0--5---/8----------
A--5--7----5------5--2-2h3p2-------5---/8--\3--2h3-
E--5--------------5--1-------------5---/8--\2------
C--5----------8\7-5--2-------------5---/8--\2------
G--5--------------5--0-------------5---/8--\2------
C--5--------------5--0-------------5---/8--\2------
      dreadful sorry,        clementine

D----------------------------2--0-----  intro riff X3
A--5--7----5------5--2-2h3p2-------3--
E--5--------------5--1-------------2--
C--5----------8\7-5--2-------------0--
G--5--------------5--0-------------0--
C--5--------------5--0-------------0--
      dreadful sorry,        clementine},
      tuning_id: Tuning.find_by_name('Clementine Tuning').id,
      artist_id: Artist.find_by_name('Elliott Smith').id,
      user_id: User.find_by_name('fakeuser').id )
clementine.save




