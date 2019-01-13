package com.go.ad.vo;

public class CategoryInfoVO {
	private int id;
	private String category;
	private int videoCount;
	private String nextPageToken;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getVideoCount() {
		return videoCount;
	}
	public void setVideoCount(int videoCount) {
		this.videoCount = videoCount;
	}
	public String getNextPageToken() {
		return nextPageToken;
	}
	public void setNextPageToken(String nextPageToken) {
		this.nextPageToken = nextPageToken;
	}
	@Override
	public String toString() {
		return "CategoryInfoVO [id=" + id + ", category=" + category + ", videoCount=" + videoCount + ", nextPageToken="
				+ nextPageToken + "]";
	}
	
	
}
