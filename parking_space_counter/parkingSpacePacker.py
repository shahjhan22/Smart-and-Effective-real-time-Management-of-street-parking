import cv2
import pickle
# img=cv2.imread('image1park.png')  this is static if we delte not update
width,height=107,48

# chek previous and add
try:
    with open('CarParkPos', 'r b') as f:
        posList=pickle.load(f)
except:
    posList=[]
def mouseClicks(events,x,y,flags,params):          #the parameter is automated give
    if events==cv2.EVENT_LBUTTONDOWN:
        posList.append((x,y))
    if events==cv2.EVENT_RBUTTONDOWN:
        for i,pos in enumerate(posList):    #chek postion is avaliable in between the delete
            x1,y1=pos
            if x1<x<x1+width and y1<y<y1+height:
                posList.pop(i)


while True:
    img=cv2.imread('image1park.png')

    for pos in posList:
        #ractangle create to dispaly
        cv2.rectangle(img,pos,(pos[0]+width,pos[1]+height),(255,0,255),2)
    cv2.imshow("imge",img)
    cv2.setMouseCallback("imge",mouseClicks)
    cv2.waitKey(1)