#tag WindowBegin Window wndMain   BackColor       =   &hFFFFFF   Backdrop        =   ""   CloseButton     =   True   Composite       =   False   Frame           =   0   FullScreen      =   False   HasBackColor    =   False   Height          =   600   ImplicitInstance=   True   LiveResize      =   True   MacProcID       =   0   MaxHeight       =   32000   MaximizeButton  =   True   MaxWidth        =   32000   MenuBar         =   343001748   MenuBarVisible  =   True   MinHeight       =   500   MinimizeButton  =   True   MinWidth        =   780   Placement       =   2   Resizeable      =   True   Title           =   "#App.kAppName"   Visible         =   True   Width           =   900   Begin PagePanel ppMain      AutoDeactivate  =   True      Enabled         =   True      Height          =   600      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   0      LockBottom      =   True      LockedInPosition=   False      LockLeft        =   True      LockRight       =   True      LockTop         =   True      PanelCount      =   3      Panels          =   ""      Scope           =   0      TabIndex        =   0      TabPanelIndex   =   0      Top             =   0      Value           =   0      Visible         =   True      Width           =   900      Begin ListMovies lstMovies         AutoDeactivate  =   True         AutoHideScrollbars=   True         Bold            =   ""         Border          =   True         ColumnCount     =   15         ColumnsResizable=   ""         ColumnWidths    =   "100%, 0"         DataField       =   ""         DataSource      =   ""         DefaultRowHeight=   36         Enabled         =   True         EnableDrag      =   False         EnableDragReorder=   ""         GridLinesHorizontal=   0         GridLinesVertical=   0         HasHeading      =   False         HeadingIndex    =   -1         Height          =   578         HelpTag         =   ""         Hierarchical    =   False         Index           =   -2147483648         InitialParent   =   "ppMain"         InitialValue    =   ""         Italic          =   ""         LastKeyPressedAt=   ""         Left            =   -1         LockBottom      =   True         LockedInPosition=   False         LockLeft        =   True         LockRight       =   ""         LockTop         =   True         RequiresSelection=   True         Scope           =   0         ScrollbarHorizontal=   ""         ScrollBarVertical=   True         SelectionType   =   0         TabIndex        =   0         TabPanelIndex   =   1         TabStop         =   True         TextFont        =   "System"         TextSize        =   11         TextUnit        =   0         Top             =   -1         Underline       =   ""         UseFocusRing    =   False         Visible         =   True         Width           =   300         _ScrollWidth    =   -1      End      Begin ActionBar ActBar         AcceptFocus     =   ""         AcceptTabs      =   ""         AutoDeactivate  =   True         Backdrop        =   ""         DoubleBuffer    =   False         Enabled         =   True         EraseBackground =   True         Height          =   25         HelpTag         =   ""         Index           =   0         InitialParent   =   "ppMain"         Left            =   -1         LockBottom      =   True         LockedInPosition=   False         LockLeft        =   True         LockRight       =   ""         LockTop         =   False         MinLeft         =   150         MinRight        =   50         Scope           =   0         TabIndex        =   1         TabPanelIndex   =   1         TabStop         =   True         Text            =   "## Items"         Top             =   576         UseFocusRing    =   True         Visible         =   True         Width           =   300      End      Begin MetaInfoCanvas cvsMovies         AcceptFocus     =   ""         AcceptTabs      =   ""         AutoDeactivate  =   True         Backdrop        =   ""         DoubleBuffer    =   False         Enabled         =   True         EraseBackground =   False         Height          =   576         HelpTag         =   ""         Index           =   -2147483648         InitialParent   =   "ppMain"         Left            =   299         LockBottom      =   True         LockedInPosition=   False         LockLeft        =   True         LockRight       =   True         LockTop         =   True         Scope           =   0         TabIndex        =   2         TabPanelIndex   =   1         TabStop         =   True         Top             =   0         UseFocusRing    =   True         Visible         =   True         Width           =   601         Begin PushButton btnTest            AutoDeactivate  =   True            Bold            =   ""            ButtonStyle     =   0            Cancel          =   ""            Caption         =   "Go!"            Default         =   ""            Enabled         =   True            Height          =   20            HelpTag         =   ""            Index           =   -2147483648            InitialParent   =   "cvsMovies"            Italic          =   ""            Left            =   679            LockBottom      =   True            LockedInPosition=   False            LockLeft        =   True            LockRight       =   False            LockTop         =   False            Scope           =   0            TabIndex        =   0            TabPanelIndex   =   1            TabStop         =   True            TextFont        =   "System"            TextSize        =   0            TextUnit        =   0            Top             =   544            Underline       =   ""            Visible         =   True            Width           =   80         End      End   End   Begin ToolMain MainTB      Enabled         =   True      Height          =   61      Index           =   -2147483648      InitialParent   =   ""      Left            =   -1      LockedInPosition=   False      Scope           =   0      TabPanelIndex   =   0      Top             =   624      Visible         =   True      Width           =   947   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Sub Close()		  Prefs.setStringValue "NSWindow Main Size", str( self.Left ) + " " + str( self.Top ) + " " + str( self.Width ) + " " + str( self.Height )		  		  Quit		End Sub	#tag EndEvent	#tag Event		Sub Open()		  If Prefs.boolForKey("FirstStartHappened") = False then		    wndSplash.Show		    prefs.boolForKey("FirstStartHappened") = True		  End If		End Sub	#tag EndEvent	#tag Event		Sub Resized()		  cvsMovies.Width = Me.Width - ActBar(0).Width + 1		End Sub	#tag EndEvent	#tag MenuHandler		Function FileFetchMetadata() As Boolean Handles FileFetchMetadata.Action			If ppMain.Value = 0 then CommonActions( "FetchMetadata", lstMovies )			// If ppMain.Value = 1 then CommonActions( "FetchMetadata", lstTVShows )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function FileFetchMetadataforallMedia() As Boolean Handles FileFetchMetadataforallMedia.Action			If ppMain.Value = 0 then CommonActions( "FetchAllMetadata", lstMovies )			// If ppMain.Value = 1 then CommonActions( "FetchAllMetadata", lstTVShows )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function FileOpenInFinder() As Boolean Handles FileOpenInFinder.Action			If ppMain.Value = 0 then CommonActions( "Reveal", lstMovies )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function FileReload() As Boolean Handles FileReload.Action			CommonActions "ReloadList"			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function MenuViewAnime() As Boolean Handles MenuViewAnime.Action			SwitchPanels 2			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function MenuViewHideToolbar() As Boolean Handles MenuViewHideToolbar.Action			MainTB.Visible = NOT MainTB.Visible			If MainTB.Visible then MenuViewHideToolbar.Text = Menu.ViewHideToolbar else MenuViewHideToolbar.Text = Menu.ViewShowToolbar			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function MenuViewMovies() As Boolean Handles MenuViewMovies.Action			SwitchPanels 0			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function MenuViewTVShows() As Boolean Handles MenuViewTVShows.Action			SwitchPanels 1			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ToolsBulkRenamer() As Boolean Handles ToolsBulkRenamer.Action			Select Case ppMain.Value						Case 0			MassRenamer( lstMovies )						End Select						Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function ToolsMovies2Folders() As Boolean Handles ToolsMovies2Folders.Action			If ppMain.Value = 0 then MassMovies2Folders( lstMovies )			Return True		End Function	#tag EndMenuHandler	#tag MenuHandler		Function ViewEditMetadata() As Boolean Handles ViewEditMetadata.Action			If ppMain.Value = 0 then CommonActions( "EditInfo", lstMovies )			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function WindowMinimize() As Boolean Handles WindowMinimize.Action			Minimize			Return True					End Function	#tag EndMenuHandler	#tag MenuHandler		Function WindowZoom() As Boolean Handles WindowZoom.Action			Maximize			Return True					End Function	#tag EndMenuHandler	#tag Method, Flags = &h0		Sub CommonActions(HitItem as String, LstBox as Listbox = Nil)		  Dim f as FolderItem		  		  Select Case HitItem		    		  case "ReloadList"		    If ppMain.Value = 0 then lstMovies.CreateList		    		  case "SortList"		    If ppMain.Value = 0 then lstMovies.SortList		    		  case "MarkAsWatched"		    MovieAttr.StatusWatched = NOT MovieAttr.StatusWatched		    If LstBox.ListIndex > -1 then f = GetFolderItem( LstBox.Cell( LstBox.ListIndex, 1 ) )		    If f <> Nil and f.Exists then MovieAttr.NFOWrite( MovieAttr.DestinationNFO( f ) )		    lstMovies.UpdateRow		    		  case "FetchAllMetadata"		    // TODO		    // If LstBox = lstMovies then Scrape.AllMovies		    If LstBox = lstMovies then dlgProgress.Start( Localizable.kSearching + ":", Localizable.Movies, LstBox.ListCount, "AllMovies")		    		  case "FetchMetadata"		    If LstBox = lstMovies then		      // If MovieName <> "" then Scrape.TMDBApiSearch( MovieName ) Else Scrape.TMDBApiSearch( lstMovies.Cell( lstMovies.ListIndex, 0 ) )		      dlgProgress.Start( Localizable.kSearching + ":", FindMovieName( MovieAttr.FolderParent, True, True ), 10, "SelectedMovie" )		    End If		    		  case "ManualSearch"		    If LstBox = lstMovies then		      Dim MovieName as String = FindMovieName( MovieAttr.FolderParent, True )		      wndSearchMovie.Show		      If MovieName <> "" then wndSearchMovie.edtSearch.Text = MovieName Else wndSearchMovie.edtSearch.Text = lstMovies.Cell( lstMovies.ListIndex, 0 )		    End If		    		  case "EditInfo"		    If LstBox = lstMovies then wndMetadataMovie.Show		    		  case "CleanAll"		    // TODO		    		  case "Clean"		    // TODO		    		  case "Reveal"		    If LstBox.ListIndex > -1 then f = GetFolderItem( LstBox.Cell( LstBox.ListIndex, 1 ) )		    If f <> Nil and f.Exists then f.Launch		    		  case "DeleteItem"		    If LstBox.ListIndex > -1 Then		      If LstBox = lstMovies then		        If dlgWindow( msgRemoveItem.ReplaceAll( "%S", LstBox.Cell( LstBox.ListIndex, 0 ) ), Localizable.kCantBeUndone ) Then		          f = GetFolderItem( LstBox.Cell( LstBox.ListIndex, 1 ) )		          If f <> Nil and f.Exists then f.MoveFileTo( SpecialFolder.Trash )		          If ppMain.Value = 0 then lstMovies.RemoveItem		        End If		      End If		      		    Else		      MsgBox Localizable.kNothingToDelete		    End If		    		  case "Trailer"		    If LstBox = lstMovies then f = FindTrailerItem( MovieAttr.FolderParent )		    If f <> Nil and f.Exists then f.Launch		    		    // Extra Art		    // TODO		  case "GetPoster"		    If LstBox = lstMovies then		      'If MovieAttr.ID_TMDB <> "" then		      'Scrape.TMDBApiArt( MovieAttr.ID_TMDB, "Poster" )		      'Else		      'Scrape.TMDBApiArt( MovieAttr.ID_IMDB, "poster" )		      'End If		      dlgProgress.Start( Localizable.kDownloading + ":", Localizable.kFanart, 2, "GetMoviePoster" )		      		      // ElseIf LstBox = lstTVShows then		      // ElseIf LstBox = lstAnime then		    End If		    		    		  case "GetFanart"		    If LstBox = lstMovies then		      'If MovieAttr.ID_TMDB <> "" then		      'Scrape.TMDBApiArt( MovieAttr.ID_TMDB, "Fanart" )		      'Else		      'Scrape.TMDBApiArt( MovieAttr.ID_IMDB, "Fanart" )		      'End If		      dlgProgress.Start( Localizable.kDownloading + ":", Localizable.kFanart, 2, "GetMovieFanart" )		      		      // ElseIf LstBox = lstTVShows then		      // ElseIf LstBox = lstAnime then		    End If		    		    		  case "GetExtraThumbs"		    If LstBox = lstMovies then		      If MovieAttr.ID_TMDB <> "" then		        Scrape.TMDBApiArt( MovieAttr.ID_TMDB, "ExtraThumbs" )		      Else		        Scrape.TMDBApiArt( MovieAttr.ID_IMDB, "ExtraThumbs" )		      End If		      		      // ElseIf LstBox = lstTVShows then		      // ElseIf LstBox = lstAnime then		    End If		    		    // TV Art		  case "GetBanner"		  case "GetClearArt"		  case "GetCharacterArt"		  case "GetLogo"		  case "GetTVThumb"		    		  End Select		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub MenuConstructor(Base as MenuItem, LstBox as listbox)		  Dim miSeperator as new MenuItem ( "-" )		  		  Dim miReload         as new MenuItem ( Menu.FileReload )         // Reload List		  Dim miSort           as new MenuItem ( Menu.CMMSortList )        // Sort List		  Dim miMarkAsWatched  as new MenuItem ( Menu.CMMMarkAsWatched )   // Mark as Watched		  Dim miScrape         as new MenuItem ( Menu.FileFetchMetadata )  // Fetch Metadata		  Dim miManualSearch   as new MenuItem ( Menu.FileManualSearch )   // Manual Search...		  Dim miEditInfo       as new MenuItem ( Menu.ViewEditMetadata )   // Edit Metadata		  Dim miClean          as new MenuItem ( Localizable.Clean )       // Clean...		  Dim miReveal         as new MenuItem ( Menu.FileShowInFinder )   // Show in Finder		  Dim miTrailer        as new MenuItem ( Menu.CMMWatchTrailer )    // Watch Trailer		  		  miReload.Name        = "ReloadList"		  miSort.Name          = "SortList"		  miMarkAsWatched.Name = "MarkAsWatched"		  miScrape.Name        = "FetchMetadata"		  miManualSearch.Name  = "ManualSearch"		  miEditInfo.Name      = "EditInfo"		  miClean.Name         = "Clean"		  miReveal.Name        = "Reveal"		  miTrailer.Name       = "Trailer"		  		  Dim miDeleteMovie    as new MenuItem ( Menu.CMMRemoveMovie )     // Remove Movie...		  Dim miDeleteTV       as new MenuItem ( Menu.CMMRemoveTVShow )    // Remove TV Show...		  Dim miDeleteAnime    as new MenuItem ( Menu.CMMRemoveAnime )     // Remove Anime...		  		  miDeleteMovie.Name = "DeleteItem"		  miDeleteTV.Name    = "DeleteItem"		  miDeleteAnime.Name = "DeleteItem"		  		  // Mark as Watched		  'If LstBox = lstMovies and MovieAttr.StatusWatched = True then miMarkAsWatched.Text = Menu.CMMMarkAsUnwatched		  'If LstBox = lstMovies and LstBox.Cell( LstBox.ListIndex, 2 ) = "" then miMarkAsWatched.Enabled = False		  'If LstBox = lstMovies and FindTrailerItem( MovieAttr.FolderParent ) = Nil then miTrailer.Enabled = False		  		  If LstBox = lstMovies then		    If MovieAttr.StatusWatched = True then miMarkAsWatched.Text = Menu.CMMMarkAsUnwatched		    miMarkAsWatched.Enabled = ( LstBox.Cell( LstBox.ListIndex, 2 ) <> "" )		    miTrailer.Enabled = ( FindTrailerItem( MovieAttr.FolderParent ) <> Nil )		  End If		  		  // Build Menu		  base.Append miReload                                       // | Reload List		  If LstBox.ListIndex <> -1 then		    base.Append miSort                                       // | Sort List		    base.Append miSeperator                                  // | -------		    If LstBox = lstMovies then base.Append miMarkAsWatched   // | Mark as Watched		    base.Append miScrape                                     // | Fetch Metadata		    base.Append miManualSearch                               // | Manual Search		    base.Append miEditInfo                                   // | Edit Metadata		    base.Append miSeperator                                  // | -------		    base.Append MenuExtraArt( LstBox )                       // | Extra Art (>)		    //base.Append miClean                                      // | Clean...		    base.Append miSeperator                                  // | -------		    base.Append miReveal                                     // | Open in Finder		    If LstBox = lstMovies then base.Append miTrailer         // | Watch Trailer		    If LstBox = lstMovies then base.Append miDeleteMovie     // | Delete Movie		    // If LstBox = lstTVShows then base.Append miDeleteTV      // | Delete TV Show		    // If LstBox = lstAnime then base.Append miDeleteAnime     // | Delete Anime		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function MenuExtraArt(LstBox as Listbox) As MenuItem		  Dim miExtraArt as new MenuItem ( Menu.ToolsExtraArt ) // Extra Arts		  Dim miSeperator as new MenuItem ( "-" )		  		  Dim miDownloadPoster as new MenuItem ( Localizable.ToolsExtraArtGetPoster ) // Download Poster...		  Dim miDownloadFanart as new MenuItem ( Localizable.ToolsExtraArtGetFanart ) // Download Fanart...		  Dim miDownloadExtraThumbs as new MenuItem ( Localizable.ToolsExtraArtGetExtraThumbs )  // Download ExtraThumbs		  Dim miDownloadBanner as new MenuItem ( Localizable.ToolsExtraArtGetBanner ) // Download Banner...		  		  miDownloadPoster.Name      = "GetPoster"		  miDownloadFanart.Name      = "GetFanart"		  miDownloadExtraThumbs.Name = "GetExtraThumbs"		  miDownloadBanner.Name      = "GetBanner"		  		  Dim miDownloadClearArt     as new MenuItem ( Localizable.ToolsExtraArtGetClearArt )     // Download ClearArt...		  Dim miDownloadCharacterArt as new MenuItem ( Localizable.ToolsExtraArtGetCharacterArt ) // Download Character Art...		  Dim miDownloadLogo         as new MenuItem ( Localizable.ToolsExtraArtGetLogo )         // Download Logo...		  Dim miDownloadTVThumb      as new MenuItem ( Localizable.ToolsExtraArtGetTVThumb )      // Download TV Thumb...		  		  miDownloadClearArt.Name     = "GetClearArt"		  miDownloadCharacterArt.Name = "GetCharacterArt"		  miDownloadLogo.Name         = "GetLogo"		  miDownloadTVThumb.Name      = "GetTVThumb"		  		  // Build Menu		  miExtraArt.Append miDownloadPoster		  miExtraArt.Append miDownloadFanart		  		  If LstBox = lstMovies then		    miExtraArt.Append miDownloadExtraThumbs		  Else		    miExtraArt.Append miDownloadBanner		    		    miExtraArt.Append miSeperator		    		    miExtraArt.Append miDownloadClearArt		    miExtraArt.Append miDownloadCharacterArt		    miExtraArt.Append miDownloadLogo		    miExtraArt.Append miDownloadTVThumb		  End If		  		  Return miExtraArt		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub SwitchPanels(Index as Integer)		  ToolButton( MainTB.Item( Index ) ).Pushed = True		  ppMain.Value = Index		  		  If Index = 0 then		    ToolsMovies2Folders.Enabled = True		    		  ElseIf Index = 1 then		    ToolsMovies2Folders.Enabled = False		    		  ElseIf Index = 2 then		    ToolsMovies2Folders.Enabled = False		    		  End If		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub UpdateRow()		  If ppMain.Value = 0 then		    lstMovies.UpdateRow		    		  ElseIf ppMain.Value = 1 then		    		  ElseIf ppMain.Value = 2 then		    		  End If		End Sub	#tag EndMethod	#tag Constant, Name = msgRemoveItem, Type = String, Dynamic = True, Default = \"Are you sure you want to remove %S\?", Scope = Public		#Tag Instance, Platform = Any, Language = en, Definition  = \"Are you sure you want to remove %S\?"		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Weet u zeker dat u %S wilt verwijderen\?"	#tag EndConstant#tag EndWindowCode#tag Events lstMovies	#tag Event		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean		  MenuConstructor base, Me		  Return True		End Function	#tag EndEvent	#tag Event		Function ContextualMenuAction(hitItem as MenuItem) As Boolean		  CommonActions hitItem.Name, Me		End Function	#tag EndEvent	#tag Event		Sub DoubleClick()		  If Me.Cell( Me.ListIndex, 2 ) = "" then CommonActions( "FetchMetadata", Me ) Else CommonActions( "EditInfo", Me )		End Sub	#tag EndEvent#tag EndEvents#tag Events ActBar	#tag Event		Sub Open(index as Integer)		  me.ClearAttachments		  		  Select case index		  case 0		    me.AttachLeft lstMovies		    me.AttachRight cvsMovies		    		  case 1		    		  case 2		    		  End Select		End Sub	#tag EndEvent	#tag Event		Sub Moved(index as Integer, Distance as Integer)		  Select case index		  case 0		    Prefs.integerForKey("NSMoviesSidebarWidth")  = me.Width		  case 1		    Prefs.integerForKey("NSTVShowsSidebarWidth") = me.Width		  case 2		    Prefs.integerForKey("NSAnimeSidebarWidth")   = me.Width		  End Select		End Sub	#tag EndEvent	#tag Event		Sub ActionMenu(index as Integer)		  If me.Index = 0 then		    Dim base as New MenuItem		    MenuConstructor base, lstMovies		    Dim HitItem as MenuItem = base.PopUp		    If HitItem <> Nil then CommonActions( HitItem.Name, lstMovies )		  End If		End Sub	#tag EndEvent	#tag Event		Sub ActionMinus(index as Integer)		  If me.Index = 0 then		    CommonActions "DeleteItem", lstMovies		  End If		End Sub	#tag EndEvent#tag EndEvents#tag Events cvsMovies	#tag Event		Sub Open()		  Me.Height = Height		  cvsMovies.Width = Width - Prefs.integerForKey("NSMoviesSidebarWidth") + 1		End Sub	#tag EndEvent	#tag Event		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean		  MenuConstructor base, lstMovies		End Function	#tag EndEvent	#tag Event		Function ContextualMenuAction(hitItem as MenuItem) As Boolean		  CommonActions hitItem.Name, lstMovies		End Function	#tag EndEvent#tag EndEvents#tag Events btnTest	#tag Event		Sub Action()		  'If Growl.Notify( "Title", "Message" ) then Return		  wndSetManager.init		End Sub	#tag EndEvent	#tag Event		Sub Open()		  Me.Visible = DebugBuild		End Sub	#tag EndEvent#tag EndEvents#tag Events MainTB	#tag Event		Sub Action(item As ToolItem)		  		  Select Case item.Name		    		  Case "Movies"		    SwitchPanels 0		    		  Case "TVShows"		    SwitchPanels 1		    		  Case "Anime"		    SwitchPanels 2		    		    ' ----------------		  Case "ScrapeInfoAll"		    If ppMain.Value = 0 then CommonActions( "FetchAllMetadata", lstMovies )		    		  Case "ScrapeInfo"		    If ppMain.Value = 0 then CommonActions( "FetchMetadata", lstMovies )		    		  Case "ManualSearch"		    If ppMain.Value = 0 then CommonActions( "ManualSearch", lstMovies )		    		  Case "ExtraArt"		    Dim HitItem as MenuItem = MenuExtraArt( lstMovies ).PopUp		    If HitItem <> Nil then CommonActions( HitItem.Name, lstMovies )		    		    ' ----------------		  Case "EditMetadata"		    If ppMain.Value = 0 then CommonActions( "EditInfo", lstMovies )		    		  Case "RefreshList"		    CommonActions( "ReloadList" )		    		  Case "CleanAll"		    		    		    ' ----------------		  Case "Donate"		    ShowURL App.DonationURL		    		  End Select		End Sub	#tag EndEvent#tag EndEvents