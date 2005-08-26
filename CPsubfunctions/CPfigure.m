function FigHandle=CPfigure(varargin);
userData.Application = 'CellProfiler';
if nargin>0 && isfield(varargin{1},'Pipeline')
    userData.MyHandles=varargin{1};
    FigHandle=figure(varargin{2:end});
    if nargin~=2 %if nargin==2 then only referring to an existing figure
        ZoomButtonCallback = 'try, CPInteractiveZoom; catch CPmsgbox(''Could not find the file called InteractiveZoomSubfunction.m which should be located in the CellProfiler folder.''); end';
        uimenu('Label','Interactive Zoom','Callback',ZoomButtonCallback);
        TempMenu = uimenu('Label','CellProfiler Image Tools');
        ListOfImageTools=userData.MyHandles.Current.ImageToolsFilenames;
        for j=2:length(ListOfImageTools)
            uimenu(TempMenu,'Label',char(ListOfImageTools(j)),'Callback',['UserData=get(gcf,''userData'');' char(ListOfImageTools(j)) '(UserData.MyHandles); clear UserData ans;']);
        end
        Font = userData.MyHandles.Current.FontSize;
        set(FigHandle,'Toolbar','figure');
        
        ToggleColorR = 'ImageHandles = findobj(gcf,''Type'',''Image'');for i = length(ImageHandles):-1:1,if size(size(get(ImageHandles(i),''CData'')),2)~=3,ImageHandles(i)=[];end;end;if ~isempty(ImageHandles),AllData=get(ImageHandles,''CData'');ImageHandles = num2cell(ImageHandles);if ~iscell(AllData), AllData={AllData};end;button=findobj(gcf,''tag'',''ToggleColorR'');for i = 1:length(AllData),tempdata{i}=AllData{i}(:,:,1);end;for i = 1:length(AllData), data=AllData{i}; if get(button,''value'')==0,set(button,''UserData'',tempdata);data(:,:,1)=0;set(ImageHandles{i},''CData'',data);else,tempdata=get(button,''UserData'');if ~iscell(tempdata),tempdata={tempdata};end;data(:,:,1)=tempdata{i};AllData{i}=data;set(ImageHandles{i},''CData'',data);end;end;end;clear data AllData button ImageHandles;';
        uicontrol('Style', 'checkbox', ...
            'Units','normalized',...
            'Position', [.6 .02 .06 .04], ...
            'Callback', ToggleColorR, 'parent',FigHandle, ...
            'FontSize',Font,'BackgroundColor',[.7,.7,.9],'min',0,...
            'max',1,'value',1,'tag','ToggleColorR','string','R');

        ToggleColorG = 'ImageHandles = findobj(gcf,''Type'',''Image'');for i = length(ImageHandles):-1:1,if size(size(get(ImageHandles(i),''CData'')),2)~=3,ImageHandles(i)=[];end;end;if ~isempty(ImageHandles),AllData=get(ImageHandles,''CData'');ImageHandles = num2cell(ImageHandles);if ~iscell(AllData), AllData={AllData};end;button=findobj(gcf,''tag'',''ToggleColorG'');for i = 1:length(AllData),tempdata{i}=AllData{i}(:,:,2);end;for i = 1:length(AllData), data=AllData{i}; if get(button,''value'')==0,set(button,''UserData'',tempdata);data(:,:,2)=0;set(ImageHandles{i},''CData'',data);else,tempdata=get(button,''UserData'');if ~iscell(tempdata),tempdata={tempdata};end;data(:,:,2)=tempdata{i};AllData{i}=data;set(ImageHandles{i},''CData'',data);end;end;end;clear data AllData button ImageHandles;';
        uicontrol('Style', 'checkbox', ...
            'Units','normalized',...
            'Position', [.66 .02 .06 .04], ...
            'Callback', ToggleColorG, 'parent',FigHandle, ...
            'FontSize',Font,'BackgroundColor',[.7,.7,.9],'min',0,...
            'max',1,'value',1,'tag','ToggleColorG','string','G');

        ToggleColorB = 'ImageHandles = findobj(gcf,''Type'',''Image'');for i = length(ImageHandles):-1:1,if size(size(get(ImageHandles(i),''CData'')),2)~=3,ImageHandles(i)=[];end;end;if ~isempty(ImageHandles),AllData=get(ImageHandles,''CData'');ImageHandles = num2cell(ImageHandles);if ~iscell(AllData), AllData={AllData};end;button=findobj(gcf,''tag'',''ToggleColorB'');for i = 1:length(AllData),tempdata{i}=AllData{i}(:,:,3);end;for i = 1:length(AllData), data=AllData{i}; if get(button,''value'')==0,set(button,''UserData'',tempdata);data(:,:,3)=0;set(ImageHandles{i},''CData'',data);else,tempdata=get(button,''UserData'');if ~iscell(tempdata),tempdata={tempdata};end;data(:,:,3)=tempdata{i};AllData{i}=data;set(ImageHandles{i},''CData'',data);end;end;end;clear data AllData button ImageHandles;';
        uicontrol('Style', 'checkbox', ...
            'Units','normalized',...
            'Position', [.72 .02 .06 .04], ...
            'Callback', ToggleColorB, 'parent',FigHandle, ...
            'FontSize',Font,'BackgroundColor',[.7,.7,.9],'min',0,...
            'max',1,'value',1,'tag','ToggleColorB','string','B');
        
        
        
    end
    set(FigHandle,'UserData',userData);
    set(FigHandle,'Color',[0.7 0.7 0.9]);
else
    FigHandle=figure(varargin{:});
    set(FigHandle,'UserData',userData);
    set(FigHandle,'Color',[0.7 0.7 0.9]);
end