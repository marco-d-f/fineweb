import sys
import boto3
from warcio.archiveiterator import ArchiveIterator

def count_warc_records(s3_path: str):
    clean_path = s3_path.replace("s3://", "")
    bucket_name, key = clean_path.split("/", 1)

    print(f"Streaming from bucket: {bucket_name}, key: {key}")

    s3 = boto3.client("s3")
    response = s3.get_object(Bucket=bucket_name, Key=key)
    stream = response["Body"]

    record_count = 0
    for record in ArchiveIterator(stream):
        record_count += 1

    print(f"SUCCESS: Counted {record_count:,} records in {s3_path}")

if __name__ == "__main__":
    default_warc = "s3://commoncrawl/crawl-data/CC-MAIN-2024-10/segments/1707947473347.0/warc/CC-MAIN-20240220211055-20240221001055-00000.warc.gz"
    target_path = sys.argv[1] if len(sys.argv) > 1 else default_warc
    
    count_warc_records(target_path)