package com.test.beans;



public class TrackDetails {

	 public Tracks track;
	public Albums album;
	public Artists artists[];
	
	TrackDetails(Tracks track, Albums album, Artists artist[]){
		this.track=track;
		this.album= album;
		this.artists=artist;
	}
	
	public TrackDetails(){
		this.track= new Tracks();
		this.album= new Albums();
		this.artists= new Artists[3];
	}

}
