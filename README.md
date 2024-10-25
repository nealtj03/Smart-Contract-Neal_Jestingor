# Smart-Contract-Neal_Jestingor

## Overview

The **SimpleTikTok** smart contract is a decentralized application that allows users to post and delete videos on the Ethereum blockchain. This contract mimics basic functionalities similar to a video-sharing platform, enabling users to manage their video content with unique identifiers.

## Features

- **Post Videos**: Users can upload videos by providing a URL.
- **Delete Videos**: Users can delete their videos, ensuring only the creator can perform this action.
- **Check Video Status**: Users can check whether a video has been posted, exists, or has been deleted.
- **Event Logging**: The contract emits events for posting and deleting videos, providing transparency.

## Smart Contract Structure

### State Variables

- `uint public videoCount`: Tracks the total number of videos posted.
- `mapping(uint => Video) public videos`: Stores video details associated with their IDs.
- `mapping(uint => bool) public videoExists`: Checks if a video exists.

### Events

- `event VideoPosted(uint id, address creator, string url)`: Emitted when a new video is posted.
- `event VideoDeleted(uint id, address creator)`: Emitted when a video is deleted.

### Functions

1. **postVideo**
   - **Parameters**: `string memory _url` - The URL of the video.
   - **Description**: Allows a user to post a new video.
   - **Checks**: Validates that the URL is not empty and that the video ID is unique.

2. **deleteVideo**
   - **Parameters**: `uint _videoId` - The ID of the video to be deleted.
   - **Description**: Allows the creator to delete their video.
   - **Checks**: Ensures the video exists and that the caller is the creator.

3. **checkVideoPosted**
   - **Parameters**: `uint _videoId` - The ID of the video.
   - **Returns**: A string indicating if the video has been posted.

4. **checkVideoExists**
   - **Parameters**: `uint _videoId` - The ID of the video.
   - **Returns**: A string indicating if the video exists.

5. **checkVideoDeleted**
   - **Parameters**: `uint _videoId` - The ID of the video.
   - **Returns**: A string indicating if the video has been deleted.

### Fallback Functions

- **fallback()**: Accepts Ether without executing any specific logic.
- **receive()**: Accepts Ether without executing any specific logic.

## Executing the Program

To run this program, you can use **Remix**, an online Solidity IDE. Follow these steps:

1. **Go to the Remix website**: Navigate to [Remix IDE](https://remix.ethereum.org/).

2. **Create a New File**:
   - Click on the "+" icon in the left-hand sidebar.
   - Name the file `SimpleTikTok.sol`.

3. **Copy and Paste the Code**:
   - Copy the provided smart contract code and paste it into the newly created file.

4. **Compile the Code**:
   - Click on the "Solidity Compiler" tab in the left-hand sidebar.
   - Ensure that the "Compiler" option is set to version `0.8.18` (or another compatible version).
   - Click on the "Compile SimpleTikTok.sol" button.

5. **Deploy the Contract**:
   - Click on the "Deploy & Run Transactions" tab in the left-hand sidebar.
   - Select the `SimpleTikTok` contract from the dropdown menu.
   - Click on the "Deploy" button.

6. **Interact with the Deployed Contract**:
   - After deploying, you will see the deployed contract instance appear in the "Deployed Contracts" section.
   - Expand the deployed contract instance to view its functions.

7. **Post a Video**:
   - Find the `postVideo` function in the contract interface.
   - Enter a valid video URL in the input field.
   - Click on the "transact" button to post the video. Check the transaction logs to confirm the successful posting.

8. **Delete a Video**:
   - To delete a video, call the `deleteVideo` function.
   - Enter the video ID of the video you want to delete.
   - Click on the "transact" button. Confirm that the video has been successfully deleted by checking the transaction logs.

9. **Check Video Status**:
   - Use the `checkVideoPosted`, `checkVideoExists`, and `checkVideoDeleted` functions to check the status of videos by entering the corresponding video ID.
   - Click on the respective function button to view the status.

10. **View Events**:
    - You can view the events emitted by the contract in the Remix console under the "Transactions" tab. This will provide you with logs for video posting and deletion.

### Author:
Neal Tracy D. Jestingor | 202111095@fit.edu.ph

### License
This project is licensed under the MIT License.
