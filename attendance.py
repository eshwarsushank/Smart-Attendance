import numpy as np
import cv2
import os
import face_recognition
import datetime
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
from firebase_admin import db
from google.cloud.firestore_v1 import Increment

path = 'faces'
images=[]
imname=[]
id=[]
mylist=os.listdir(path)
print(mylist)

cred = credentials.Certificate("/Users/eshwarsushank/Downloads/attendance-a4319-firebase-adminsdk-tb2q3-e75afb9331.json")
firebase_admin.initialize_app(cred)
db1 = firestore.client()

for cl in mylist:
    curimg=cv2.imread(f'{path}/{cl}')
    images.append(curimg)
    id.append(cl.split(".")[1])
    imname.append(cl.split(".")[0])
#print(imname)
#print(id)

def encodings(images):
    encodinglist=[]
    for img in images:
        img = cv2.cvtColor(img,cv2.COLOR_BGR2RGB)
        encode = face_recognition.face_encodings(img)[0]
        encodinglist.append(encode)
    return encodinglist

daycsv = str(datetime.date.today())
a=str(daycsv)
def markattend(name,idk):
    with open('attendance.csv','r+') as f:
        mydatalist=f.readlines()
        #print(mydatalist)
        namelist=[]
        for line in mydatalist:
            entry = line.split(',')
            namelist.append(entry[0])
        if name not in namelist:
            now = datetime.datetime.now()
            dstring=now.strftime('%H:%M:%S')
            f.writelines(f'\n{name},{idk},{dstring}')
            name1=name
            rol=idk
            dat=dstring
            Count = db1.collection('Student').document(name1)
            print(Count)
            Count.update({'count': Increment(+1)})
            day = str(datetime.date.today())
            att = db1.collection("Student").document(name1).collection(name1).document(day)
            att.set({
                    'name': name1,
                    'rollnum': rol,
                    'Time':dat
                })
            qw=db1.collection("Student").document(name1)
            qw.update({
                'name':name1,
                'rollnumber': rol,
            })
            bbb = db1.collection("date").document(day)
            bbb.set({
                'Time': dat
            })
encodingknown=encodings(images)
print('Encoding completed')

cap = cv2.VideoCapture(0)

f=open('attendance.csv','r+')
f.truncate()
print("done")

while True:
    success, img=cap.read()
    imgs = cv2.resize(img,(0,0),None,0.25,0.25)
    imgs=cv2.cvtColor(imgs,cv2.COLOR_BGR2RGB)

    facecurframe=face_recognition.face_locations(imgs)
    encodecurframe=face_recognition.face_encodings(imgs,facecurframe)

    for encodeface,faceloc in zip(encodecurframe,facecurframe):
        match=face_recognition.compare_faces(encodingknown,encodeface)
        facedist=face_recognition.face_distance(encodingknown,encodeface)
        #print(facedist)
        matchindex=np.argmin(facedist)

        if match[matchindex]:
            name = imname[matchindex].upper()
            idk = id[matchindex]
            #print(name)
            #print(idk)
            y1,x2,y2,x1 = faceloc
            y1, x2, y2, x1=y1*4,x2*4,y2*4,x1*4
            cv2.rectangle(img,(x1,y1),(x2,y2),(0,255,0),2)
            cv2.rectangle(img,(x1,y2-35),(x2,y2),(0,255,0),cv2.FILLED)
            cv2.putText(img,name,(x1+6,y2-6),cv2.FONT_HERSHEY_PLAIN,1,(255,255,255),2)
            markattend(name,idk)

    cv2.imshow('webcam',img)
    if cv2.waitKey(1)& 0xFF == ord('r'):
        break