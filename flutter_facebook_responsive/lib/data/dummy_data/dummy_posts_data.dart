import 'dummy_online_users_data.dart';
import 'dummy_user_data.dart';
import '../model/post.dart';

 List<Post> posts = [
 const Post(
    user: currentUser,
    caption: 'Check out these cool puppers',
    timeAgo: '58m',
    imageUrl: 'https://images.unsplash.com/photo-1525253086316-d0c936c814f8',
    likes: '2.3k',
    comments: 184,
    shares: 96,
  ),
  Post(
    user: onlineUsers[5],
    caption:
        'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    timeAgo: '3hr',
    imageUrl: 'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    likes: '2.3k',
    comments: 79,
    shares: 18,
  ),
  Post(
    user: onlineUsers[4],
    caption: 'This is a very good boi.',
    timeAgo: '8hr',
    imageUrl:
        'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    likes: '2.3k',
    comments: 201,
    shares: 27,
  ),
  Post(
    user: onlineUsers[3],
    caption: 'Adventure 🏔',
    timeAgo: '15hr',
    imageUrl:
        'https://images.unsplash.com/photo-1573331519317-30b24326bb9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
    likes: '2.3k',
    comments: 183,
    shares: 42,
  ),
  Post(
    user: onlineUsers[0],
    caption:
        'More placeholder text for the soul: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    timeAgo: '1d',
    imageUrl: 'https://images.unsplash.com/photo-1575535468632-345892291673?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    likes: '2.3k',
    comments: 37,
    shares: 9,
  ),
  Post(
    user: onlineUsers[9],
    caption: 'A classic.',
    timeAgo: '1d',
    imageUrl:
        'https://images.unsplash.com/reserve/OlxPGKgRUaX0E1hg3b3X_Dumbo.JPG?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    likes: '2.3k',
    shares: 129,
    comments: 301,
  )
];