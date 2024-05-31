### 3. Managing Disk Space
We provide call center automation as one of our products. Essentially it processes user's audio and return a correct audio response. For managing all these audios that are generated in the due process we use NFS. With the call volumes we have, it essential that disk space of NFS should be managed properly.

Write a bash script to clean out all the .wav  audios data in /data/audios/folder that are older than 40hrs by default (If no argrument passed) and if you pass first arguments to script with relative time like 1hrs or 100hrs then script should clean out audio data. Also generate a log file with the namedeleted-files-<date>-<month>-<year>.log which should contain:

name of audio file
time of creation of audio file (ISO Format)
time of deletion of audio file (ISO Format)
For example:

A sample script should like sh managing-disk-space.sh 10hrs

A sample log file deleted-files-12-02-2020.log will contain:

...
audio_0010023.wav 10-02-2020T08:37:16+05:30 12-02-2020T10:18:40+05:30
audio_0010024.wav 10-02-2020T08:38:16+05:30 12-02-2020T10:18:42+05:30
audio_0010025.wav 10-02-2020T08:38:50+05:30 12-02-2020T10:18:45+05:30
...
Deliverables:
A Shell Script.
A Log file.
A README file with instructions how to run.

### Solution

# Managing Disk Space Script

This script is designed to clean out `.wav` audio files from the `/data/audios/folder` directory that are older than a specified number of hours. By default, it deletes files older than 40 hours. You can specify a different time threshold as an argument.

## Usage Instructions

1. **Ensure the script is executable:**

    ```bash
    chmod +x managing-disk-space.sh
    ```

2. **Run the script with the default threshold (40 hours):**

    ```bash
    ./managing-disk-space.sh
    ```

    This will delete `.wav` files older than 40 hours from the `/data/audios/folder` directory.

3. **Run the script with a custom threshold (e.g., 10 hours):**

    ```bash
    ./managing-disk-space.sh 10
    ```

    This will delete `.wav` files older than 10 hours from the `/data/audios/folder` directory.

4. **Log File:**

    The script generates a log file named `deleted-files-<date>-<month>-<year>.log` which contains details of the deleted files.

    Example log file name: `deleted-files-31-05-2024.log`

## Note

I conducted research online to complete this task as I am a beginner. I'm eager to learn more and passionate about DevOps. Given the opportunity, I'm committed to expanding my knowledge and skills in this field.
