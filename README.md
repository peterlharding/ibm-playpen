# Overview

See - https://cloud.ibm.com/apidocs/speech-to-text


# Audio formats (content types)

The service accepts audio in the following formats (MIME types).

For formats that are labeled Required, you must use the content-type parameter with the request to specify the format of the audio.
For all other formats, you can omit the content-type parameter or specify application/octet-stream with the parameter to have the service automatically detect the format of the audio.
Where indicated, the format that you specify must include the sampling rate and can optionally include the number of channels and the endianness of the audio.

```
application/octet-stream
audio/alaw (Required. Specify the sampling rate (rate) of the audio.)
audio/basic (Required. Use only with narrowband models.)
audio/flac
audio/g729 (Use only with narrowband models.)
audio/l16 (Required. Specify the sampling rate (rate) and optionally the number of channels (channels) and endianness (endianness) of the audio.)
audio/mp3
audio/mpeg
audio/mulaw (Required. Specify the sampling rate (rate) of the audio.)
audio/ogg (The service automatically detects the codec of the input audio.)
audio/ogg;codecs=opus
audio/ogg;codecs=vorbis
audio/wav (Provide audio with a maximum of nine channels.)
audio/webm (The service automatically detects the codec of the input audio.)
audio/webm;codecs=opus
audio/webm;codecs=vorbis
```

## See also: Supported audio formats.

* https://cloud.ibm.com/docs/speech-to-text?topic=speech-to-text-audio-formats
* https://cloud.ibm.com/docs/speech-to-text?topic=speech-to-text-models-ng



Table 1 lists the supported next-generation languages and models. Low-latency columns indicate whether each model supports the low_latency parameter for speech recognition. For more information, see Low latency.

Table 1. Supported next-generation language models

```
Language	
Multimedia model	Multimedia
low-latency support	
Telephony model	Telephony
low-latency support
Arabic (Modern Standard)	Not available	Not available	ar-MS_Telephony	Yes
Dutch (Belgian)	Not available	Not available	nl-BE_Telephony	Yes
English (Australian)	Not available	Not available	en-AU_Telephony	Yes
English (United Kingdom)	Not available	Not available	en-GB_Telephony	Yes
English (United States)	en-US_Multimedia	No	en-US_Telephony	Yes
French (Canadian)	Not available	Not available	fr-CA_Telephony	Yes
French (France)	fr-FR_Multimedia
IBM Cloud only	Not available	fr-FR_Telephony	Yes
German	Not available	Not available	de-DE_Telephony	Yes
Italian	Not available	Not available	it-IT_Telephony	Yes
Portuguese (Brazilian)	Not available	Not available	pt-BR_Telephony	Yes
Spanish (Castilian)	Not available	Not available	es-ES_Telephony	Yes
Unlike previous-generation models, next-generation models do not include the word model in their names.
```

# Specifying a model for speech recognition

You use a next-generation model in a speech recognition request just as you do a previous-generation model, by using the model parameter to indicate the model that is to be used. The following example HTTP request uses the en-US_Telephony model for speech recognition:


```
curl -X POST -u "apikey:{apikey}" --header "Content-Type: audio/wav" --data-binary @{path}audio-file.wav "{url}/v1/recognize?model=en-US_Telephony"
```

If you omit the model parameter from a speech recognition request, the service uses the previous-generation US English broadband model, en-US_BroadbandModel, by default.


