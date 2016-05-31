%Purpose: Assignment 4 for Scientific Programming course Spring 2016
%Input: N/A
%Output: Posner Paradigm experiment, Plots of RT x Distance 3 ways
%Assumptions/Dependencies:none
%3/5/2016

%% 0 Init
%clear the workspace/close all figures/ clear command line. CLEAN SLATE
clear all;
close all;
clc;

%% 1 Introduction Screens
stimDisplay = figure('units','normalized','outerposition',[0 0 1 1],'color',[.85 0 .3],'MenuBar','none'); %opens a full screen figure
xlim([0 1]) %set the range of values on the x-axis to (0 to 1)
ylim([0 1]) % set the rand of values on the y axis from (0 to 1)
axis off;
hold on;
text(.5,.75,'WELCOME!','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',70,'FontName','HanziPen SC'); %Instruction line 1
text(.5,.5,'To the Peripheral Cue Challenge!','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',50,'FontName','HanziPen SC'); %Instruction line 2
text(.5,.3,'press any key to continue...','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',40,'FontName','HanziPen SC');
rectangle('Position',[0 0 1 1]); %Just some decorative rectangles to go with the theme
rectangle('Position',[.035 .035 .93 .93]);%Just some decorative rectangles to go with the theme
rectangle('Position',[.07 .07 .86 .86]);%Just some decorative rectangles to go with the theme
rectangle('Position',[.105 .105 .79 .79]);
pause; %Wait for input to move on
clf;axis off %clear the figure for the next set of instructions
rectangle('Position',[0 0 1 1]);
rectangle('Position',[.035 .035 .93 .93]);
rectangle('Position',[.07 .07 .86 .86]);
rectangle('Position',[.105 .105 .79 .79]);
text(.5,.7,'For this challenge, you MUST keep your eyes  on the cross','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',35,'FontName','HanziPen SC'); %Directions
text(.5,.65,'AT ALL TIMES!','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',35,'FontName','HanziPen SC');%Directions
text(.5,.5,'+','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',60,'FontName','HanziPen SC');%Directions
text(.5,.2,'press any key to continue...','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',40,'FontName','HanziPen SC');
pause;
clf;axis off
rectangle('Position',[0 0 1 1]);
rectangle('Position',[.035 .035 .93 .93]);
rectangle('Position',[.07 .07 .86 .86]);
rectangle('Position',[.105 .105 .79 .79]);
text(.5,.75,'While fixating your eyes on the cross, a cue will appear QUICKLY','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',32,'FontName','HanziPen SC');
text(.5,.5,'+','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',60,'FontName','HanziPen SC');
rectangle('Position',[.13 .45 .1 .1],'EdgeColor','y');
rectangle('Position',[.77 .45 .1 .1],'EdgeColor','k');
text(.5,.2,'press any key to continue...','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',25,'FontName','HanziPen SC');
pause;
%Here's where I show an example of a valid trial
clf;axis off;
rectangle('Position',[0 0 1 1]);
rectangle('Position',[.035 .035 .93 .93]);
rectangle('Position',[.07 .07 .86 .86]);
rectangle('Position',[.105 .105 .79 .79]);
text(.5,.75,'Still fixating, a target will then appear in one of the visible boxes','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',32,'FontName','HanziPen SC');
text(.5,.5,'+','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',60,'FontName','HanziPen SC');
rectangle('Position',[.13 .45 .1 .1],'EdgeColor','k');
rectangle('Position',[.77 .45 .1 .1],'EdgeColor','k');
text(.18,.5, char(10084), 'color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',40');
text(.5,.2,'press any key to continue...','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',25,'FontName','HanziPen SC');
pause;
clf; axis off;
rectangle('Position',[0 0 1 1]);
rectangle('Position',[.035 .035 .93 .93]);
rectangle('Position',[.07 .07 .86 .86]);
rectangle('Position',[.105 .105 .79 .79]);
text(.5,.75,'As soon as you see the target, Press the spacebar!','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',32,'FontName','HanziPen SC');
text(.5,.5,'Sometimes the target will be in the cued box...','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',32,'FontName','HanziPen SC');
text(.5,.4,'Other times it wont...','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',32,'FontName','HanziPen SC');
text(.5,.3,'So try to be vigilant!','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',32,'FontName','HanziPen SC');
text(.5,.2,'Press any key to begin...','color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',32,'FontName','HanziPen SC');
pause;
delete(stimDisplay);
%End of Instructions!


%% 2 Create the GRID

gridSize = 16;
StimDisplay = figure('units','normalized','outerposition',[0 0 1 1],'color',[.85 0 .3],'MenuBar','none'); %opens a full screen figure
hold on
axis off;
for xx = 1:sqrt(gridSize)
    for yy = 1:sqrt(gridSize);
        rectangle('Position',[xx yy 1 1], 'EdgeColor','w')
        text(2.915, 3,'+','FontSize',80,'Color','w','FontWeight','bold')
    end
end


%% Mod to get random cue placement and trial typee
gridSize = 16;
posnerData = zeros(1280,6);
posnerData(:,1) = mod(randperm(1280),16)+1 ;
%add trial type
for kk = 1:gridSize; %kk represent s
    temp = mod(randperm(80),4)+1; %created 80 new numbers of value 1-4 randomply mixed up
    row = find(posnerData(:,1) ==kk); %
    posnerData(row,2) = temp;
end;
%posnerDATA Columns =cue location(1-6)/trial type (1-4)

%% Initialize some locations on the Grid as Boxes

hold on
axis off;
for xx = 1:sqrt(gridSize); %starts loop from 1-4 along x asis
    for yy = 1:sqrt(gridSize); %starts loop from 1-4 along y axis
        rectangle('Position',[xx yy 1 1], 'EdgeColor','w'); %makes a 1x1 rectangle in the xx or yy position (1-4) the that iteration of the loop
        text(2.915, 3,'+','FontSize',80,'Color','w','FontWeight','bold') %makes a more visible fixation point
    end
    
end
cueLocation = [];
targetLocation = [];
invalidTargetLocation = [];
Box1 = [1, 1]
Box2 = [2, 1]
Box3 = [3, 1]
Box4 = [4, 1]
Box5 = [1, 2]
Box6 = [2, 2]
Box7 = [3, 2]
Box8 = [4, 2]
Box9 = [1, 3]
Box10 = [2, 3]
Box11 = [3, 3]
Box12 = [4, 3]
Box13 = [1, 4]
Box14 = [2, 4]
Box15 = [3, 4]
Box16 = [4, 4]

%% Look in the first column of posnerData to define cue position
for ii = 1:length(posnerData); %starts loop at first row(trial) of posnerDa
    if posnerData(ii,1)==1; %if the number in the first column is a 1
        cueLocation = Box1; %then the cue goes into Box1 with the coordinates defined above
    elseif posnerData(ii,1)==2;%and so on...
        cueLocation = Box2;
    elseif posnerData(ii,1)==3;
        cueLocation = Box3;
    elseif posnerData(ii,1)==4;
        cueLocation = Box4;
    elseif posnerData(ii,1)==5;
        cueLocation = Box5;
    elseif posnerData(ii,1)==6;
        cueLocation = Box6;
    elseif posnerData(ii,1)==7;
        cueLocation = Box7;
    elseif posnerData(ii,1)==8;
        cueLocation = Box8;
    elseif posnerData(ii,1)==9;
        cueLocation = Box9;
    elseif posnerData(ii,1)==10;
        cueLocation = Box10;
    elseif posnerData(ii,1)==11;
        cueLocation = Box11;
    elseif posnerData(ii,1)==12;
        cueLocation = Box12;
    elseif posnerData(ii,1)==13;
        cueLocation = Box13;
    elseif posnerData(ii,1)==14;
        cueLocation = Box14;
    elseif posnerData(ii,1)==15;
        cueLocation = Box16;
    end
    
    %put the cue in for 100ms
    pause(randi(500)/1000);     %jitter the onset of the cue between 0-500 milliseconds
    A = rectangle('Position',[(cueLocation) 1 1],'FaceColor','y') %SHOW THE CUE!
    pause(100/1000);%Cue duration is set at 100ms throughout the experiment
    delete(A);
    %put the target in for Valid Trials
    if posnerData(ii,2)==1 | posnerData(ii,2) ==2  %for valid trials only
        targetLocation = cueLocation; %the target location and cue location will be the same
        if posnerData(ii,2) ==1; %if posnerData column 2 indicated a valid trial with 100ms delay
            posnerData(ii,5) = nan; %Column 5 only applies to invalid trials
            posnerData(ii,6) = nan; %Column 6 only applies to invalid trials
            posnerData(ii,7) = nan; %Column 7 only applies to invalid trials
            pause(100/1000); %the delay between cue and target
            tic;%start the timer
            B = text(targetLocation(1), targetLocation(2),char(10084),'color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',80); %SHOW THE TARGET!
            pause;%wait for spacebar
            posnerData(ii,3) = toc;
            delete(B); %clear the target
        elseif posnerData(ii,2)==2 %if it's a val-300 trial
            posnerData(ii,5) = nan; %Column 5 only applies to invalid trials
            posnerData(ii,6) = nan; %Column 6 only applies to invalid trials
            posnerData(ii,7) = nan; %Column 7 only applies to invalid trials
            pause(300/1000); %the delay between cue and target
            tic;
            B = text(targetLocation(1), targetLocation(2),char(10084),'color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',80); %SHOW THE TARGET!
            pause;
            posnerData(ii,3) =toc;
            delete(B);
        end
        
        %Get the target location for the invalid trials
        %put the target in for invalid trials
    elseif posnerData(ii,2) ==3 | posnerData(ii,2) == 4
        invalidTargetLocation(ii) = randsample(setdiff(1:16,(posnerData(ii,1))), 1); %pick a random number from 1-16 excluding the cue position of the current trial
        if invalidTargetLocation(ii) ==1;
            targetLocation = Box1;
            posnerData(ii,4) = 1; %populate target location for invalid trials in the iith row, 4th column of posnerData for use later
        elseif invalidTargetLocation(ii) == 2
            targetLocation = Box2;
            posnerData(ii,4) = 2;
        elseif invalidTargetLocation(ii) == 3;
            targetLocation = Box3;
            posnerData(ii,4) = 3;
        elseif invalidTargetLocation(ii) == 4;
            targetLocation = Box4;
            posnerData(ii,4) = 4;
        elseif invalidTargetLocation(ii) == 5;
            targetLocation = Box5;
            posnerData(ii,4) = 5;
        elseif invalidTargetLocation(ii) == 6;
            targetLocation = Box6;
            posnerData(ii,4) = 6;
        elseif invalidTargetLocation(ii) == 7;
            targetLocation = Box7;
            posnerData(ii,4) = 7;
        elseif invalidTargetLocation(ii) == 8;
            targetLocation = Box8;
            posnerData(ii,4) = 8;
        elseif invalidTargetLocation(ii) == 9;
            targetLocation = Box9;
            posnerData(ii,4) = 9;
        elseif invalidTargetLocation(ii) == 10;
            targetLocation = Box10;
            posnerData(ii,4) = 10;
        elseif invalidTargetLocation(ii) == 11;
            targetLocation = Box11;
            posnerData(ii,4) = 11;
        elseif invalidTargetLocation(ii) == 12;
            targetLocation = Box12;
            posnerData(ii,4) = 12;
        elseif invalidTargetLocation(ii) == 13;
            targetLocation = Box13;
            posnerData(ii,4) = 13;
        elseif invalidTargetLocation(ii) == 14;
            targetLocation = Box14;
            posnerData(ii,4) = 14;
        elseif invalidTargetLocation(ii) == 15;
            targetLocation = Box15;
            posnerData(ii,4) = 15;
        elseif invalidTargetLocation(ii) == 16;
            targetLocation = Box16;
            posnerData(ii,4) = 16;
        end
        
        if posnerData(ii,2)==3; %if it's an inval-100 trial
            X = [cueLocation;targetLocation]; %
            posnerData(ii,5) = pdist(X,'euclidean'); %Computes the distance between cue and target and puts it in the firth column of posnerData
            posnerData(ii,6) = abs(cueLocation(1) - targetLocation(1))  %get the horizontal distance between cue and target
            posnerData(ii,7) = abs(cueLocation(2) - targetLocation(2)) %get the vertical distance between cue and target
            pause(100/1000);
            tic;
            B = text(targetLocation(1),targetLocation(2),char(10084),'color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',80);
            pause;
            posnerData(ii,3) = toc;
            delete(B);
        elseif posnerData(ii,2)==4; %if it's an inval-300 trial
            X = [cueLocation;targetLocation];
            posnerData(ii,5) = pdist(X,'euclidean')
            posnerData(ii,6) = abs(cueLocation(1) - targetLocation(1))
            posnerData(ii,7) = abs(cueLocation(2) - targetLocation(2)) %get the vertical distance between cue and target
            
            pause(300/1000);
            tic;
            B = text(targetLocation(1),targetLocation(2),char(10084),'color','w','HorizontalAlignment','center','VerticalAlignment','middle','FontSize',80);
            pause;
            posnerData(ii,3) = toc;
            delete(B);
        end
    end
end
clf;
text(.5, .5, 'DONE!')

%% Q.1 Is there a difference in Reaction Times between Valid and Invalid Trials?
validTrialInd = find(posnerData(:,2)==1 | posnerData(:,2)==2); %find valid trials from second row of posnerDATA
TrialRT(:,1) = posnerData(validTrialInd,3); %The first column of TrialRT will contain RTs from valid trials only
InvalidTrialInd = find(posnerData(:,2)==3 | posnerData(:,2)==4); %find invalid trials from second row of posnerData
TrialRT(:,2) = posnerData(InvalidTrialInd,3); %the second column of TrialRT will contain RTs from invalid trials only
%Do the T-test
[sig, p, CI] = ttest(TrialRT(:,1),TrialRT(:,2));
stats(1,1) = sig;
stats(1,2) = p;
%A.1 If stats(1,1)is equal to 1, then there is a significant difference in
%RT between Valid and Invalid
%% Q.2 Is there a difference in the reaction times for different delays?
shortDelayInd = find(posnerData(:,2)==1 | posnerData(:,2)==3); %find valid trials from second row of posnerDATA
DelayRT(:,1) = posnerData(shortDelayInd,4); %The first column of TrialRT will contain RTs from valid trials only
longDelayInd = find(posnerData(:,2)==2 | posnerData(:,2)==4); %find invalid trials from second row of posnerData
DelayRT(:,2) = posnerData(longDelayInd,4); %the second column of TrialRT will contain RTs from invalid trials only
%Do the T-test
[sig, p, CI] = ttest(DelayRT(:,1),DelayRT(:,2));
stats(2,1) = sig;
stats(2,2) = p;
%A.2 If stats(1,1) is equl to 1, then there is a significant difference in
%RT between 100 and 300ms delays between cue and target.
%% Q.3 Does the distance between target and cue matter?
%scatter plot of reaction time as a function of Distance
figure('units','normalized','outerposition',[0 0 1 1])
hold on
DistanceBetweenCueandTarget = scatter(posnerData(:,5),posnerData(:,3),'MarkerFaceColor','g')
Horizontal_Distance = scatter(posnerData(:,6), posnerData(:,3),'MarkerFaceColor','b')
Vertical_Distance = scatter(posnerData(:,7), posnerData(:,3),'MarkerFaceColor','m')
h = lsline;
set(h(1),'color','g')
set(h(2),'color','b')
set(h(3),'color','m')
xlabel('Distance Between Cue & Target','FontSize',20);
ylabel('Reaction Times','FontSize',20);
title('Does the Distance Between Target and Cue Matter?','FontSize',20)
legend('DistanceBetweenCueAndTarget','HorizontalDistance','VerticalDistance')
% A3. See Plots
% Q.4 Is there a qualitative difference between the slope of these lines.
%A4. The line with the smallest slop will indicate the fastest scan speed
%direction.
%% Q5. What is the speed of the Attentional Scanner?
%column of RT for invalid trials
%TrialRT(:,2)
%column of total distance euclidean
%posnerData(:,5)
% so it's distance over time
ScannerSpeedperTrial = [];
ScannerSpeedperTrial = posnerData(:,5)./ TrialRT(:,2);
% so distance then element wise divide RT
%scannerSpeed = posnerData(ii,
%store those values
ScannerSpeed= mean(ScannerSpeedperTrial(1:5,1));