package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.test.beans.*;


public class ApplicationDao {

	public List<Tracks> searchTracks(String searchString, Connection connection) {
		Tracks Track = null;
		List<Tracks> TrackList = new ArrayList<>();
		
		try{
			
		//	System.out.println("I am in dao, and connection is ready");
			String sql = "select * from Tracks where Track_name like '%"+searchString+"%'";
			
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
		//	System.out.println("I am in dao, and resultset is ready");
			
			while(set.next()){
				Track= new Tracks();
				Track.setTrackId(set.getInt("track_id"));
				Track.setTrackName(set.getString("Track_name"));
				Track.sethits(set.getInt("hits"));
				TrackList.add(Track);
				
			}

		}
		catch(SQLException exception){
			exception.printStackTrace();
		}
		return TrackList;
	}
	
	public List<Artists> searchArtists(String searchString, Connection connection) {
		Artists artist = null;
		List<Artists> ArtistList = new ArrayList<>();
		
		try{
			
			//System.out.println("I am in dao, and connection is ready");
			String sql = "select * from artists where Artist_name like '%"+searchString+"%'";
			
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
		//	System.out.println("I am in dao, and resultset is ready");
			
			while(set.next()){
				artist= new Artists();
				artist.setArtistName(set.getString("Artist_name"));
				artist.setArtistImg(set.getString("Artist_img"));
				artist.setArtistId(set.getInt("artist_id"));
				ArtistList.add(artist);
				
			}

		}
		catch(SQLException exception){
			exception.printStackTrace();
		}
		return ArtistList;
	}
	
	public List<Albums> searchAlbum(String searchString, Connection connection) {
		Albums album = null;
		List<Albums> AlbumList = new ArrayList<>();
		
		try{
			
		//	System.out.println("I am in dao, and connection is ready");
			String sql = "select * from albums where Album_name like '%"+searchString+"%'";
			
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
		//	System.out.println("I am in dao, and resultset is ready");
			
			while(set.next()){
				album= new Albums();
				album.setAlbumName(set.getString("Album_name"));
				album.setAlbumImg(set.getString("Album_img"));
				album.setReleaseDate(set.getString("Release_date"));
				album.setAlbumId(set.getInt("album_id"));
				AlbumList.add(album);
				
			}

		}
		catch(SQLException exception){
			exception.printStackTrace();
		}
		return AlbumList;
	}
	
	public int registerUser(User user,Connection connection) {
		int rowsAffected =0;
		
		try {
		
		//	System.out.println("I am in Application Dao and connection is made.");
			
			String insertQuery= "insert into users ( Email, Password, firstname , lastname, dob, gender, about,user_img) values(?,?,?,?,?,?,?,?)";
			java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
			statement.setString(1, user.getEmail());
			statement.setString(2, user.getPassword());
			statement.setString(3, user.getFirstName());
			statement.setString(4, user.getLastName());
			statement.setString(5, user.getDateOfBirth());
			statement.setString(6, user.getGender());
			statement.setString(7, user.getAboutYou());
			statement.setString(8, user.getImgPath());
			
			System.out.println(user.getImgPath());
			System.out.println(statement);
			
			rowsAffected = statement.executeUpdate();
			
	//		System.out.println("Excecuted query: "+ insertQuery + "and rows updated = "+ rowsAffected);
			
			
		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowsAffected;
	}

	public int validateUser(String email, String password, Connection connection) {
		int rvalue=0;
		try {
			
			
			String query="select * from users where email= ? and password= ?";
			java.sql.PreparedStatement statement=connection.prepareStatement(query);
			statement.setString(1, email);
			statement.setString(2, password);
		//	System.out.println("i am in validdateuser");
			
			 ResultSet set= statement.executeQuery();
			 if(set==null)
				  rvalue=0;
			 else rvalue=1;
		
	} catch (SQLException exception) {
		exception.printStackTrace();
	}
	return rvalue;
		
	}
	
	public TrackDetails getTrackDetails(int TrackId, Connection connection) {
		TrackDetails trackdetails= new TrackDetails();
		try {
			
			String query1="select * from tracks where track_id= ?";
			java.sql.PreparedStatement statement = connection.prepareStatement(query1);
			statement.setInt(1, TrackId);
			
	//		System.out.println("I am in Application Dao and goig to execute query for trackdetails");
			
			ResultSet set1= statement.executeQuery();
			
			
			if(set1.next()) {
				trackdetails.track.setTrackId(set1.getInt("track_id"));
				trackdetails.track.setTrackName(set1.getString("Track_name"));
				trackdetails.track.setTrackLink(set1.getString("track_link"));
				trackdetails.track.sethits(set1.getInt("hits"));
				
			}
		//	System.out.println("Executed query for track details.");
			
			//Fetching Album details
			int Album_id= set1.getInt("Album_id");
			
		//	System.out.println(Album_id);
			
			String query2= "select * from albums where album_id= ?";
			java.sql.PreparedStatement statement1 = connection.prepareStatement(query2);
			statement1.setInt(1, Album_id);
			
		//	System.out.println("I am in Application Dao and going to execute query for trackdetails.albums");
			
			ResultSet set2= statement1.executeQuery();
			if(set2.next()) {
				trackdetails.album.setAlbumName(set2.getString("Album_name"));
				trackdetails.album.setAlbumImg(set2.getString("Album_img"));
				trackdetails.album.setReleaseDate(set2.getString("Release_date"));
				trackdetails.album.setAlbumId(set2.getInt("album_id"));
				
			}
			//System.out.println("Executed query for Album details.");
			//Fetching Artist details
			int artist1= set1.getInt("Artist1");
			
			//System.out.println("Artist 1 id: " + artist1);
			Artists a=new Artists();
			
			String query3= "select * from artists where artist_id= ?";
			java.sql.PreparedStatement statement2 = connection.prepareStatement(query3);
			statement2.setInt(1, artist1);
			
		//	System.out.println("I am in Application Dao and going to execute query for trackdetails.artist[1]");
			
			ResultSet set3= statement2.executeQuery();
			
			if(set3.next()) {
				a.setArtistId(set3.getInt("artist_id"));
				a.setArtistName(set3.getString("Artist_name"));
				a.setArtistImg(set3.getString("Artist_img"));
			}
			
			trackdetails.artists[0]=a;
			
			//Fetching details for artist 2
			
			if(set1.getObject("Artist2") !=null) {
				int artist2= set1.getInt("Artist2");
				System.out.println("Artist 2 id: " + artist2);
				Artists b=new Artists();
				
				String query4= "select * from artists where artist_id= ?";
				java.sql.PreparedStatement statement3 = connection.prepareStatement(query4);
				statement3.setInt(1, artist2);
				
			//	System.out.println("I am in Application Dao and going to execute query for trackdetails.artist[2]");
				
				ResultSet set4= statement3.executeQuery();
				
				if(set4.next()) {
					b.setArtistId(set4.getInt("artist_id"));
					b.setArtistName(set4.getString("Artist_name"));
					b.setArtistImg(set4.getString("Artist_img"));
				}
				
				trackdetails.artists[1]=b;
			}
			
			//Fetching details for Artist 3
			
			if(set1.getObject("Artist3") !=null) {
				int artist3= set1.getInt("Artist3");
				System.out.println("Artist 3 id: " + artist3);
				Artists c=new Artists();
				
				String query5= "select * from artists where artist_id= ?";
				java.sql.PreparedStatement statement4 = connection.prepareStatement(query5);
				statement4.setInt(1, artist3);
				
				System.out.println("I am in Application Dao and going to execute query for trackdetails.artist[3]");
				
				ResultSet set5= statement4.executeQuery();
				
				if(set5.next()) {
					c.setArtistId(set5.getInt("artist_id"));
					c.setArtistName(set5.getString("Artist_name"));
					c.setArtistImg(set5.getString("Artist_img"));
				}
				
				trackdetails.artists[2]=c;
			}
			
			
		}
		catch (SQLException exception) {
			exception.printStackTrace();
		}
		
		System.out.println("Exiting Dao layer");
		return trackdetails;
	}

    public List<SubscriptionPlan> getSubscriptionPlans(Connection connection ){
    	
    	List<SubscriptionPlan> SubscriptionPlanList = new ArrayList<SubscriptionPlan>();
    	try {
    		
        	String query = "select * from subscriptionplan";
        	java.sql.PreparedStatement statement = connection.prepareStatement(query);
        	ResultSet set= statement.executeQuery();
        	
        	while(set.next()) {
        		SubscriptionPlan  s= new SubscriptionPlan();
        		s.setSubscriptionId(set.getInt("subscription_id"));
        		s.setPlanName(set.getString("Plan_name"));
        		s.setCost(set.getInt("Cost"));
        		s.setValidity(set.getInt("validity"));
        		s.setSongsOffered(set.getInt("songs_offered"));
        		SubscriptionPlanList.add(s);
        		
        }
    	}
    	catch (SQLException exception) {
			exception.printStackTrace();
		}
    	
    	return SubscriptionPlanList;
}
    
    public User getProfileDetails(Connection connection, String email) {
         
		User user = null;
		try {
	

			// write select query to get profile details
			String sql = "select * from users where email =?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, email);
		//	System.out.println(email);
			// execute query, get resultset and return User info
			ResultSet set = statement.executeQuery();
			while (set.next()) {
				user = new User();
				user.setFirstName(set.getString("firstname"));
				user.setLastName(set.getString("lastname"));
				user.setGender(set.getString("gender"));
				user.setAboutYou(set.getString("about"));
				user.setDownloadCount(set.getInt("downloadCount"));
				user.setEmail(set.getString("email"));
				user.setImgPath(set.getString("user_img"));
			}
			
		//	System.out.println("got user: ");

		}

		catch (SQLException exception) {
			exception.printStackTrace();
		}
		return user;
    }
    
    public List<Tracks> getTracksByAlbum(int albumId, Connection connection){
    	
    	Tracks Track = null;
		List<Tracks> TrackList = new ArrayList<>();
		
		try{
			
		//	System.out.println("I am in dao, and connection is ready");
			String sql = "select * from Tracks where album_id = "+ albumId;
			
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
		//	System.out.println("I am in dao, and resultset is ready");
			
			while(set.next()){
				Track= new Tracks();
				Track.setTrackId(set.getInt("track_id"));
				Track.setTrackName(set.getString("Track_name"));
				Track.sethits(set.getInt("hits"));
				TrackList.add(Track);
			
			}

		}
		catch(SQLException exception){
			exception.printStackTrace();
		}
		return TrackList;
   
    }
    
 public List<Tracks> getTracksByArtist(int artistId, Connection connection){
    	
    	Tracks Track = null;
		List<Tracks> TrackList = new ArrayList<>();
		
		try{
			
		//	System.out.println("I am in dao, and connection is ready");
			String sql = "select * from Tracks where Artist1 = "+ artistId + " or Artist2 =" + artistId+ " or Artist3= "+artistId;
			
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
		//	System.out.println("I am in dao, and resultset for artist search is ready");
			
			while(set.next()){
				Track= new Tracks();
				Track.setTrackId(set.getInt("track_id"));
				Track.setTrackName(set.getString("Track_name"));
				Track.sethits(set.getInt("hits"));
				TrackList.add(Track);
			
			}

		}
		catch(SQLException exception){
			exception.printStackTrace();
		}
		return TrackList;
   
    }
 
 public List<Tracks> getTracksByCategory(String category, Connection connection){
 	
 	Tracks Track = null;
		List<Tracks> TrackList = new ArrayList<>();
		
		try{
			
			//System.out.println("I am in dao, and connection is ready");
			String sql = "select * from Tracks where album_id in ( select album_id from albums where category1 like '%"+ category + "%' or category2 = '%"+category+ "%')";
			
			Statement statement = connection.createStatement();
			
			ResultSet set = statement.executeQuery(sql);
		//	System.out.println("I am in dao, and resultset for category search is ready");
			
			while(set.next()){
				Track= new Tracks();
				Track.setTrackId(set.getInt("track_id"));
				Track.setTrackName(set.getString("Track_name"));
				Track.sethits(set.getInt("hits"));
				TrackList.add(Track);
			
			}

		}
		catch(SQLException exception){
			exception.printStackTrace();
		}
		return TrackList;

 }
 
 public List<Tracks> getTracksByLanguage(String lang, Connection connection){
	 	
	 	Tracks Track = null;
			List<Tracks> TrackList = new ArrayList<>();
			
			try{
				
			//	System.out.println("I am in dao, and connection is ready");
				String sql = "select * from Tracks where album_id in ( select album_id from albums where Lang = '" + lang +"' )";
				
				Statement statement = connection.createStatement();
				
				ResultSet set = statement.executeQuery(sql);
			//	System.out.println("I am in dao, and resultset for language search is ready");
				
				while(set.next()){
					Track= new Tracks();
					Track.setTrackId(set.getInt("track_id"));
					Track.setTrackName(set.getString("Track_name"));
					Track.sethits(set.getInt("hits"));
					TrackList.add(Track);
				
				}

			}
			catch(SQLException exception){
				exception.printStackTrace();
			}
			return TrackList;

	 }
          public  int subscribe(int subscriptionId, String email , Connection connection) {
        	  
        	  int status=0;
        	  try {
        		  String query = "update users set Subscription_Id = " + subscriptionId + " where email= '" + email + "'";
            	  Statement statement = connection.createStatement();
            	    status= statement.executeUpdate(query);
        	  }
        	  catch(SQLException exception){
  				exception.printStackTrace();
  			}
        	  return status;
          }
          
 public  int createPlaylist(String playlistName,String email, Connection connection) {
        	  
        	  int status=0;
        	  try {
        		  System.out.println("Details: "+ playlistName +" email : "+ email);
        		  String query= "insert into playlist ( playlist_name, user_id) values ('"+ playlistName +"', (select User_ID from users where email ='"+email +"'))";
            	  Statement statement = connection.createStatement();
            	    status= statement.executeUpdate(query);
            	    System.out.println("Details: "+ playlistName +" email : "+ email);
        	  }
        	  catch(SQLException exception){
  				exception.printStackTrace();
  			}
        	  return status;
          }

public List<Playlist> viewPlaylists(Connection connection, String email) {
		List<Playlist> playlists= new ArrayList<>();
		Playlist p;
		String query= "Select playlist_id, playlist_name from playlist,users where playlist.User_Id=users.user_id and users.email='"+email +"'";
	//	System.out.println(query);
		try {
			Statement statement=connection.createStatement();
			
			ResultSet rs = statement.executeQuery(query);
			
			while(rs.next()) {
				p= new Playlist();
				p.setPlaylistId(rs.getInt("Playlist_ID"));
				p.setPlaylistName(rs.getString("Playlist_Name"));
			//	System.out.println(p.getPlaylistName());
				playlists.add(p);
			}
		}
		catch(SQLException e) {
			System.out.println("Error occured");
		}
		if(playlists!=null)
			return playlists;
		else 
			return null;
}



public int addTracktoPlaylist(int playlistId, int trackId, Connection connection) {
	
	String query="Insert into playlisttracks(Playlist_Id, Track_Id) values("+ playlistId +" ,"+ trackId +")" ;
	System.out.println(query);
	int status=0;
	try {
		Statement statement= connection.createStatement();
		 status= statement.executeUpdate(query);
		
		}
	catch(SQLException e) {
		e.printStackTrace();
	}
	return status;
}

public int likeTrack(int TrackId, Connection connection) {
	int status=0;
	String query="Update tracks set hits=hits+1 where track_id="+TrackId;
	try {
		Statement statement= connection.createStatement();
		status=statement.executeUpdate(query);
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
	return status;
}

public List<Tracks> viewPlaylistTracks(int PlaylistId,Connection connection){
	
	Tracks Track = null;
	List<Tracks> TrackList = new ArrayList<>();
	
	try {
		String query = "select * From tracks where track_id in ( select track_id from playlisttracks where Playlist_Id=" + PlaylistId +")";
		Statement statement = connection.createStatement();
		System.out.println(query);
		ResultSet set = statement.executeQuery(query);
		
		while(set.next()){
			Track= new Tracks();
			Track.setTrackId(set.getInt("track_id"));
			Track.setTrackName(set.getString("Track_name"));
			Track.sethits(set.getInt("hits"));
			TrackList.add(Track);
		
		}
	}
	catch(SQLException e) {
		  e.printStackTrace();
	}
	return TrackList;
}

public int validateDownloadPermission(Connection connection,  String email) {
	
	String query="select downloadCount, songs_offered from users, subscriptionplan where users.email='"+ email +"' and users.Subscription_Id=subscriptionplan.subscription_id";
	int downloadCount=0;
	int songsOffered=0;
	int status=0;
	ResultSet set;
	try {
		Statement statement= connection.createStatement();
		set=statement.executeQuery(query);
		if(set.next()) {
			downloadCount = set.getInt("downloadCount");
			songsOffered= set.getInt("songs_offered");
		}
	}
	catch(SQLException e) {
		  e.printStackTrace();
	}
	
	if(downloadCount< songsOffered) {
		
		status++;
		String query1="update users set users.downloadCount=downloadCount + 1 where users.email='"+ email +"'";
		try {
			if(status==1) {
			Statement statement= connection.createStatement();
			statement.execute(query1);
			}
			
		}
		catch(SQLException e) {
			  e.printStackTrace();
		}
		return status;
	}
	else
		return 0;
}
}