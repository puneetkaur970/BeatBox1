package com.test.beans;

public class Tracks {

	private int TrackId;
	private String TrackName;
	private int hits;
	private String TrackLink;

	public int getTrackId() {
		return TrackId;
	}

	public void setTrackId(int TrackId) {
		this.TrackId = TrackId;
	}

	public String getTrackName() {
		return TrackName;
	}

	public void setTrackName(String TrackName) {
		this.TrackName = TrackName;
	}

	public int gethits() {
		return hits;
	}

	public void sethits(int hits) {
		this.hits = hits;
	}
	
	public void setTrackLink(String TrackLink) {
		this.TrackLink=TrackLink;
	}
	
	public String getTrackLink() {
		return TrackLink;
	}
}
