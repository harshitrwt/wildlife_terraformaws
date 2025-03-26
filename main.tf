# creating s3 buckets

resource "aws_s3_bucket" "mybucket" {
    bucket = var.bucketname

}

## ownership controls for us only
resource "aws_s3_bucket_ownership_controls" "mybucket" {
    bucket = aws_s3_bucket.mybucket.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}


## making the bucket public 
resource "aws_s3_bucket_public_access_block" "mybucket" {
    bucket = aws_s3_bucket.mybucket.id
    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

## s3 bucket acl, depends on above to plolicies

resource "aws_s3_bucket_acl" "mybucket" {
    depends_on = [ 
        aws_s3_bucket_ownership_controls.mybucket,
        aws_s3_bucket_public_access_block.mybucket,
     ]
    bucket = aws_s3_bucket.mybucket.id
    acl = "public-read"
}

## website configuration resource
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.mybucket.id
  key = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}


resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.mybucket.id
  key = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}


resource "aws_s3_object" "tigerprofile" {
    bucket = aws_s3_bucket.mybucket.id
    key = "tiger.png"
    source = "tiger.png"
    acl = "public-read"
    
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.mybucket]
}