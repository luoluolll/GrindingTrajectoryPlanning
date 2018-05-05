%PREPROCESSSTLVFN preprocess v, f, n returned by stlRead
%
% [v, f, n] = preprocessStlVFN(v, f, n) used as a parameter
% for function readStlModel, do some process for v, f, n returned
% by stlRead. It should be specified for particular job, in my
% project, the process includes only translation to make the target
% at the right place relative to robot arm.

function [v, target_face, target_normal] = preprocessStlVFN(v, f, n)
%% move, translation
v = v + [-300, 0, 0];
%% get the faces with y>120, get their area and normal
% the stl file is saved as patch_x_y.bmp, and the target has y>120
target_face = [];
[faces_s, ~] = size(f); % number of faces
for i = 1:faces_num
    if ~any(v(f(i, :), 3) < threshold_z)
        target_face = [target_face; i];
    end
end
target_normal = n(target_face, :); % normal vector
end