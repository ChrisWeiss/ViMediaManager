#tag ModuleProtected Module Scrape	#tag Method, Flags = &h0		Sub TMDBApi(ID as String)		  MsgBox ID		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub TMDBApiSearch(MovieName as String)		  Dim XmlContent as String		  Dim sckt as new TMDB		  sckt.Yield = True		  Cancelled = False		  		  Progress( Localizable.kSearching + ":", MovieName, 2, 1 )		  If Cancelled then Return		  Dim s as string = sckt.URL_Search( MovieName )		  XmlContent = sckt.Get( sckt.URL_Search( MovieName ), Prefs.integerForKey("TimeOut") )		  sckt.Close		  		  If Cancelled then Return		  If XmlContent.InStr( 0, "503 Service Unavailable" ) > 0 then		    Progress( "close" )		    MsgBox Localizable.kError + " 503:" + kServiceUnavailable + chr(13) + chr(13) + Localizable.kPleaseTryAgainLater		    		  ElseIf XmlContent.InStr( 0, "Database Error" ) > 0 then		    Progress( "close" )		    MsgBox msgDatabaseError + chr(13) + chr(13) + kConnectionError		    		  ElseIf XmlContent.Left(5) = "<?xml" then		    Progress( Localizable.kSearching + ":", MovieName, 2, 2 )		    sckt.SearchResults( XmlContent, MovieName )		    Progress( "close" )		    		  ElseIf XmlContent = "" then		    Progress( "close" )		    MsgBox msgTMDBConnectionError + chr(13) + chr(13) + Localizable.kCheckInternetConnection		    		  Else		    Progress( "close" )		    MsgBox msgInvalidContent + chr(13) + chr(13) + XmlContent		    		  End If		End Sub	#tag EndMethod	#tag Property, Flags = &h1		Protected Cancelled As Boolean = False	#tag EndProperty	#tag Property, Flags = &h1		Protected ManualSearch As Boolean = False	#tag EndProperty	#tag Property, Flags = &h1		Protected MassSearch As Boolean = False	#tag EndProperty	#tag Constant, Name = kConnectionError, Type = String, Dynamic = True, Default = \"Error establishing a database connection.", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"Error establishing a database connection."		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Fout in een verbinding met de database."	#tag EndConstant	#tag Constant, Name = kManualSearchMovie, Type = String, Dynamic = True, Default = \"Do you want to manually search for the movie\?", Scope = Protected		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Do you want to manually search for the movie\?"		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Wil je handmatig naar de film zoeken\?"	#tag EndConstant	#tag Constant, Name = kNoMoviesFound, Type = String, Dynamic = True, Default = \"No movies were found.", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"No movies were found."		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geen films gevonden."	#tag EndConstant	#tag Constant, Name = kNoMoviesFoundTryAgain, Type = String, Dynamic = True, Default = \"No movies were found\x2C try again with less keywords or an alternative title.", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"No movies were found\x2C try again with less keywords or an alternative title."		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Geen films gevonden\x2C probeer opnieuw met minder sleutel woorden of een alternatieve titel."	#tag EndConstant	#tag Constant, Name = kServiceUnavailable, Type = String, Dynamic = True, Default = \"Service Unavailable", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"Service Unavailable"		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Dienst niet beschikbaar"	#tag EndConstant	#tag Constant, Name = msgDatabaseError, Type = String, Dynamic = True, Default = \"Database Error", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"Database Error"		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Database fout"	#tag EndConstant	#tag Constant, Name = msgInvalidContent, Type = String, Dynamic = True, Default = \"Invalid content found", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"Invalid content found"		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Ongeldige inhoud gevonden"	#tag EndConstant	#tag Constant, Name = msgTMDBConnectionError, Type = String, Dynamic = True, Default = \"Failed to connect to the movie database.", Scope = Protected		#Tag Instance, Platform = Any, Language = en, Definition  = \"Failed to connect to the movie database."		#Tag Instance, Platform = Any, Language = nl, Definition  = \"Kon geen verbinding maken met de film database."	#tag EndConstant	#tag ViewBehavior		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Module#tag EndModule