Setup an account with IBM Watson and create an APIKEY which you should then add  to the .CREDENTIALS file.


Example Usage:

```
 $ ./send.sh 20210719_105303.flac
+ grep APIKEY ../.CREDENTIALS
+ awk '{print $2}'
hqvJNrhnQt1Hho-t5mDYi4sSttcPzofsv-N2kULgjmd4
++ grep APIKEY ../.CREDENTIALS
++ awk '{print $2}'
+ APIKEY=hqvJNrhnQt1Hho-t5mDYi4sSttcPzofsv-N2kULgjmd4
+ URL=https://api.au-syd.speech-to-text.watson.cloud.ibm.com/instances/8a63fe87-41d9-4e39-a35e-3f90bc70fd58
+ FILE=20210719_105303.flac
+ curl -X POST -u apikey:hqvJNrhnQt1Hho-t5mDYi4sSttcPzofsv-N2kULgjmd4 --header 'Content-Type: audio/flac' --data-binary @20210719_105303.flac 'https://api.au-syd.speech-to-text.watson.cloud.ibm.com/instances/8a63fe87-41d9-4e39-a35e-3f90bc70fd58/v1/recognize?model=en-AU_Telephony'
{
   "result_index": 0,
   "results": [
      {
         "final": true,
         "alternatives": [
            {
               "transcript": "testing testing one two three four five six seven ",
               "confidence": 0.7
            }
         ]
      }
   ]
```

See aditional PDF documentation downloaded from IBM

* hands-on-lab-customization.pdf



