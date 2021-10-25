%participants Collin Kreis, Ben Shively, Jacob Boyette
%contributions Jacob 4-5, Ben 1, Collin 3, All did 2 together

answer1 := project cdCode, cdTitle, labelName, numberSold (select year = 2003 and rating <= 5 and location = 'Los Angeles' (topCDs njoin (cd njoin recordingLabel)));

highestSold := project numberSold, year (select year = 2003 (cd));
highestSoldCopy(numberSoldCopy, yearCopy) := highestSold;
highestSoldNotMax := project numberSold, year (select  year = 2003 and numberSold<numberSoldCopy(highestSold product highestSoldCopy));
highestSoldMax := highestSold difference highestSoldNotMax;
maxCDsSold := composedOf njoin(cd njoin (highestSoldMax njoin song));
answer2 := project songCode, songTitle (maxCDsSold);

answer3 := project artistID, firstName, lastName (select rating>5 (artist njoin (writtenBy njoin topSongs)));

memberCopy(groupCodeCopy, artistIDCopy) := project groupCode, artistID (member);
moreThanOneGroup := project artistID (select artistID = artistIDCopy and groupCode <> groupCodeCopy (member product memberCopy));
answer4 := project artistID, firstName, lastName (artist njoin moreThanOneGroup);

answer5 := project groupCode, groupName (select location = 'Detroit' (recordingLabel njoin (musicalGroup njoin cd)));








