pragma solidity ^0.8.0;

contract SimpleTikTok {
    uint public videoCount; // Track the number of videos posted

    struct Video {
        uint id;
        address creator;
        string url;
    }

    mapping(uint => Video) public videos; // Store videos by ID
    mapping(uint => bool) public videoExists; // Track if a video exists

    event VideoPosted(uint id, address creator, string url);
    event VideoDeleted(uint id, address creator);

    // Function to post a video
    function postVideo(string memory _url) public {
        require(bytes(_url).length > 0, "Video URL is required."); // Require URL to be non-empty

        // Increment video count for each new video
        videoCount++;

        // Check if the video ID has already been posted
        require(!videoExists[videoCount], "This video ID has already been posted.");

        videos[videoCount] = Video(videoCount, msg.sender, _url);
        videoExists[videoCount] = true; // Mark the video as existing

        emit VideoPosted(videoCount, msg.sender, _url);
    }

    // Function to delete a video
    function deleteVideo(uint _videoId) public {
        require(videoExists[_videoId], "Video does not exist."); 

        Video memory video = videos[_videoId];
        require(video.creator == msg.sender, "Only the creator can delete this video."); // Check if the caller is the creator

        // Assert that the video exists and is being deleted correctly
        assert(videoExists[_videoId] == true); // This should always be true if the previous checks passed.

        delete videos[_videoId]; // Delete the video from the mapping
        videoExists[_videoId] = false; // Mark the video as deleted
        videoCount--; // Decrement video count
        emit VideoDeleted(_videoId, msg.sender);
    }

    // Function to check if a video has been posted 
    function checkVideoPosted(uint _videoId) public view returns (string memory) {
        if (videoExists[_videoId]) {
            return "The video has been posted.";
        } else {
            return "The video has not been posted.";
        }
    }

    // Function to check if a video exists 
    function checkVideoExists(uint _videoId) public view returns (string memory) {
        if (videoExists[_videoId]) {
            return "The video exists.";
        } else {
            return "The video does not exist.";
        }
    }

    // Function to check if a video has been deleted
    function checkVideoDeleted(uint _videoId) public view returns (string memory) {
        if (videoExists[_videoId]) {
            return "The video has not been deleted.";
        } else {
            return "The video has been deleted.";
        }
    }

    // Fallback function to accept Ether without doing anything
    fallback() external payable {
        // Ether is accepted without any action
    }

    // Receive function to accept Ether without doing anything
    receive() external payable {
        // Ether is accepted without any action
    }
}

//https://www.tiktok.com/@luisareyartista/video/7419941649649814789
//https://www.tiktok.com/@kenvasquez0/video/7422473109443333381
