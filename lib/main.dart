import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyHome(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Post {
  final String username;
  final String userImage;
  final String postImage;
  final String description;

  Post({
    required this.username,
    required this.userImage,
    required this.postImage,
    required this.description,
  });
}

class MyHome extends StatelessWidget {
  MyHome({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> storyData = [
    {"name": "Your Story", "image": "images/your_story.jpg"},
    {"name": "John", "image": "images/1.jpg"},
    {"name": "Jane", "image": "images/2.jpg"},
    {"name": "Alex", "image": "images/3.jpg"},
    {"name": "Emily", "image": "images/4.jpg"},
  ];

  final List<Post> posts = [
    Post(
      username: "JohnDoe",
      userImage: "images/1.jpg",
      postImage: "images/3.jpg",
      description: "Enjoying a sunny day at the beach. ☀️🏖️",
    ),
    Post(
      username: "JaneSmith",
      userImage: "images/2.jpg",
      postImage: "images/4.jpg",
      description: "Exploring the beautiful countryside. 🌳🌼",
    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.camera_alt_outlined,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: Center(
          child: Image.asset(
            'images/insta.jpg',
            height: 130,
            width: 180,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Circular profile icons
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: storyData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Circular story icon with image
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.pink,
                            width: 2,
                          ),
                        ),
                        child: index == 0
                            ? Icon(
                          Icons.add,
                          color: Colors.pink,
                        )
                            : ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            storyData[index]["image"],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Text below the circle
                      SizedBox(height: 4),
                      Text(
                        index == 0 ? "Your Story" : storyData[index]["name"],
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Posts
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostContainer(post: posts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PostContainer extends StatelessWidget {
  final Post post;

  PostContainer({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User information (username and image)
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(post.userImage),
                radius: 20,
              ),
              SizedBox(width: 8),
              Text(
                post.username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          // Post image
          Image.asset(
            post.postImage,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          // Description
          Text(post.description),
          SizedBox(height: 8),
          // Buttons (like, comment, share, save)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.mode_comment_outlined),
                onPressed: () {},
              ),
              SizedBox(width: 153),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
