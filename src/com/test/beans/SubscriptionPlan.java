package com.test.beans;

public class SubscriptionPlan {
	private int subscriptionId;
	private String planName;
	private int cost;
	private int validity;
	private int songsOffered;
	
	public SubscriptionPlan(int s_id, String planName, int cost, int validity, int songsOffered) {
		this.subscriptionId=s_id;
		this.planName=planName;
		this.cost=cost;
		this.validity=validity;
		this.songsOffered= songsOffered;
	}
	public SubscriptionPlan() {
		
	}
	
	public int getSubscriptionId() {
		return subscriptionId;
	}
	
	public void setSubscriptionId(int id) {
		this.subscriptionId=id;
	}
	
	public String getPlanName() {
		return planName;
	}
	
	public void setPlanName(String pname) {
		this.planName=pname;
	}
	
	public int getCost() {
		return cost;
	}
	
	public void setCost(int cost) {
		this.cost=cost;
	}
	
	public int getValidity() {
		return validity;
	}
	
	public void setValidity(int validity) {
		this.validity=validity;
	}
	
	public int getSongsOffered() {
		return songsOffered;
	}
	
	public void setSongsOffered(int songsOffered) {
		this.songsOffered=songsOffered;
	}
}
