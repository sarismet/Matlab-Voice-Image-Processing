clc;
close all;
original_cigarette= imread('cigarette.png');
original_joker=imread('joker.png');
gray_cigarette = rgb2gray(original_cigarette);   
gray_joker = rgb2gray(original_joker);
flower = imread('flower.png');
cigarettePoints = detectSURFFeatures(gray_cigarette);
jokerPoints = detectSURFFeatures(gray_joker);
[cigaretteFeatures, cigarettePoints] = extractFeatures(gray_cigarette, cigarettePoints);
[jokerFeatures, jokerPoints] = extractFeatures(gray_joker, jokerPoints);
mainPairs = matchFeatures(cigaretteFeatures, jokerFeatures);
matchedcigarettePoints = cigarettePoints(mainPairs(:, 1), :);
matchedjokerPoints = jokerPoints(mainPairs(:, 2), :);
[tform, inliercigarettePoints, inlierjokerPoints] = ...
    estimateGeometricTransform(matchedcigarettePoints, matchedjokerPoints, 'similarity');
cigarettePolygon = [1, 1;...                           % top-left
size(gray_cigarette, 2), 1;...                 % top-right
size(gray_cigarette, 2), size(gray_cigarette, 1);... % bottom-right
1, size(gray_cigarette, 1);...                 % bottom-left
1, 1];                   % top-left again to close the polygon
flowerPolygon = transformPointsForward(tform, cigarettePolygon);
figure;
imshow(joker);
hold on;
image(flowerPolygon(:, 1), flowerPolygon(:, 2), papatya);

