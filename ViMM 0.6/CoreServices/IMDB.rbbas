#tag ClassProtected Class IMDBInherits HTTPSocket	#tag Event		Sub Error(code as integer)		  SocketError( code, Me )		  		Exception err as NilObjectException		  Me.Close		End Sub	#tag EndEvent	#tag Method, Flags = &h0		Sub IMDbFullInfo(XmlContent as String)		  Dim Xml as new XmlDocument		  Dim xroot as XmlNode		  Dim Plot as String		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent.ReplaceAll("&", "and") )		  xroot = Xml.Child(0).FirstChild		  		  Plot = xroot.GetAttribute("plot")		  If Plot.Len > MovieAttr.DescriptionPlot.Len and _		    Plot <> "" and _		    Plot <> "N/A" and _		    Prefs.textStringForKey("DBLanguage") = "en" then		    MovieAttr.DescriptionPlot = Trim( RemoveLinks( Plot ) )		  End If		  		  If xroot.GetAttribute("rating")   <> "" then MovieAttr.Rating        = Val( xroot.GetAttribute( "rating" ) )		  If xroot.GetAttribute("votes")    <> "" then MovieAttr.RatingVotes   = Val( xroot.GetAttribute( "votes"  ) )		  If xroot.GetAttribute("year")     <> "" then MovieAttr.DateYear      = Val( xroot.GetAttribute( "year"   ) )		  If xroot.GetAttribute("released") <> "" and  MovieAttr.DatePremiered = ""  then MovieAttr.DatePremiered  = xroot.GetAttribute( "released" )		  If xroot.GetAttribute("director") <> "" then MovieAttr.CreditDirector = xroot.GetAttribute( "director" )		  If xroot.GetAttribute("writer")   <> "" then MovieAttr.CreditWriter   = xroot.GetAttribute( "writer"   )		  		  // weighted rating (WR) = (v ÷ (v+m)) × R + (m ÷ (v+m)) × C		  Dim WeightedRating as Double = ( MovieAttr.RatingVotes / ( MovieAttr.RatingVotes + 3000 ) ) * MovieAttr.Rating + ( 3000 / ( MovieAttr.RatingVotes + 3000 ) ) * 6.9		  If MovieAttr.RatingVotes = 3000 and WeightedRating >= 8 then MovieAttr.RatingTop250 = WeightedRating		  		  If xroot.GetAttribute("genre")    <> "" then		    Dim Genres() as String = xroot.GetAttribute("genre").Split(", ")		    If Genres.Ubound > MovieAttr.Genres.Ubound then MovieAttr.Genres = Genres		  End If		  		  Return		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub IMDbShortInfo(XmlContent as String)		  Dim Xml as new XmlDocument		  Dim xroot as XmlNode		  Dim Outline as String		  		  Xml.PreserveWhitespace = False		  Xml.LoadXml( XmlContent )		  xroot = Xml.Child(0).FirstChild		  		  Outline = Trim( xroot.GetAttribute("plot") )		  If Outline.Len > MovieAttr.DescriptionOutline.Len and _		    Outline <> "" and _		    Outline <> "N/A" and _		    Prefs.textStringForKey("DBLanguage") = "en" then		    MovieAttr.DescriptionOutline = RemoveLinks( Outline )		  End If		  		  Return		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function URL_IMDbApi(IMDbID as String = "", Full as Boolean = True) As String		  If Full then		    Return "http://www.imdbapi.com/?i=" + IMDBID + "&r=xml&plot=full"		  Else		    Return "http://www.imdbapi.com/?i=" + IMDBID + "&r=xml&plot=short"		  End If		End Function	#tag EndMethod	#tag Note, Name = IMDB Api				3th Party Api:		http://www.imdbapi.com/	#tag EndNote	#tag ViewBehavior		#tag ViewProperty			Name="Address"			Visible=true			Group="Behavior"			Type="String"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="defaultPort"			Group="Behavior"			InitialValue="0"			Type="integer"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="httpProxyAddress"			Group="Behavior"			Type="string"			EditorType="MultiLineEditor"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="httpProxyPort"			Group="Behavior"			InitialValue="0"			Type="integer"			InheritedFrom="HTTPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			Type="Integer"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Port"			Visible=true			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InheritedFrom="TCPSocket"		#tag EndViewProperty		#tag ViewProperty			Name="yield"			Group="Behavior"			InitialValue="0"			Type="boolean"			InheritedFrom="HTTPSocket"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass