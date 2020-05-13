Requirements 
------------
user upload/download

sync files on multiple devices 

editing file

Estimations
------------
Assume number of users = 1 Billion

number of active user = 100 Million

devices per user = 2

one user have files = 100

total files = 10000 Million = 1 Billion

Each file size = 100 KB

Total space = 100KB * 10000Million = 1 PB

High Level Design
-----------------
Diagram

Component Design
----------------

a file could be large in size to upload, after editing, uploading whole file is not good idea.
Chunker, which divide file into multiple chunks and upload chunk which has a update. Then there is Indexer which create meta data about chunks like follow:


{
	chunk_id: integer,
	chunk_order: number,
	object: {
		version: number,
		is_folder: boolean,
		file_name: string,
		file_extension: string,
		file_size: number,
		file_path: string,
		user: {
			user_name: string,
			email: string,
			device: {
				device_name: string
			},
		}
	}
}

Here Consistency is required because other devices might be connected to internet and need correct changes of files

So, when upload is done to S3, then events are send to messaging queue with all information about metadata and then saved to db

Similiarly this information is re-broadcasted, so that other clients can get it.


Data depulication
-----------------

To avoid duplicate file upload, we can generate a hash for a file and match is its already there then don't upload it.

benefits

* Save bandwidth
* storage usage

MetaData partitioning
---------------------

#### Vertical Partitioning 
  distrubute data based on feature, user related in one db and file/chunks related in another db.
  file/chunks db has Billion of users, So problems:
  - we need to partition it further
  - Joins from different DB

#### Range Based Partitioning
  - filepath starting from 'a' character can go in one db server and so on..
  Problem:
  - Unbalanced distribution

#### Hash Based Partioning
  calculating hash of fileId and distribute according to hash

#### Consistent Hashing

Simplicity - Every one like simple system/solution
------------
Scaling Web Server
Load Balancer

Scaling DB Server
Caching -- file cache / CDN -> 

indexes
load balancer
replication



Scaling Image/Video/Asset Server
CDN


