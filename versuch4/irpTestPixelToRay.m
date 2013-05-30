%
% irpTestPixelToRay can be used to check if irpPixelToRay was programmed
% correctly. If it was, the resulting plot should look like the one in the
% script (including colors!!)

irpInitData

if size(irpPixelToRay(20,20,f,s,cc)) ~= [1 3]
    disp('irpPixelToRay should return a 1 x 3 vector. Please change source code.');
else
    clear testray
    testray{1} = irpPixelToRay(20,20,f,s,cc);
    testray{2} = irpPixelToRay(cc(1),20,f,s,cc);
    testray{3} = irpPixelToRay(620,20,f,s,cc);
    testray{4} = irpPixelToRay(620,460,f,s,cc);
    testray{5} = irpPixelToRay(cc(1),460,f,s,cc);
    testray{6} = irpPixelToRay(20,460,f,s,cc);

    figure
    hold on
    xlim([-1 1]);xlim('manual');
    ylim([-1 1]);ylim('manual');
    zlim([-0.5 1]);zlim('manual');
    daspect([1,1,1]);
    campos('manual');
    campos([-3,-10,-12]);
    camtarget('manual');
    camtarget([0,0,0.25]);

    plot3([0 0.5],[0 0],[0 0],'-k','LineWidth',2);
    plot3([0 0],[0 0.5],[0 0],'-k','LineWidth',2);
    plot3([0 0],[0 0],[0 0.5],'-k','LineWidth',2);

    pat = patch([-0.5 0.5 0.5 -0.5],[-0.35 -0.35 0.35 0.35],[1 1 1 1],'black');
    %set(pat,'FaceAlpha',0.4);

    for i=1:6
        switch i
            case 1 
                color = '-y';
            case 2 
                color = '-c';
            case 3 
                color = '-m';
            case 4 
                color = '-r';
            case 5 
                color = '-g';
            case 6 
                color = '-b';
        end
        plot3([0 testray{i}(1)],[0 testray{i}(2)],[0 testray{i}(3)],color,'LineWidth',2);
    end
end

clear testray color pat
