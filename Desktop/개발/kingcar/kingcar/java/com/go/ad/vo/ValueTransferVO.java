package com.go.ad.vo;

public class ValueTransferVO {
	private String category;
	private int videoCount;
	private String nextPageToken;
	private String title;
	private String videoId;
	private String thumbnail;
	private String channelTitle;
	private int viewCount;
	private String viewFlag;
	
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getVideoId() {
		return videoId;
	}
	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getChannelTitle() {
		return channelTitle;
	}
	public void setChannelTitle(String channelTitle) {
		this.channelTitle = channelTitle;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getViewFlag() {
		return viewFlag;
	}
	public void setViewFlag(String viewFlag) {
		this.viewFlag = viewFlag;
	}
	@Override
	public String toString() {
		return "ValueTransferVO [category=" + category + ", videoCount=" + videoCount + ", nextPageToken="
				+ nextPageToken + ", title=" + title + ", videoId=" + videoId + ", thumbnail=" + thumbnail
				+ ", channelTitle=" + channelTitle + ", viewCount=" + viewCount + ", viewFlag=" + viewFlag + "]";
	}
	
	
	
	
	
}
