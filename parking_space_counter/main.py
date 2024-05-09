from flask import Flask, render_template, Response
import cv2
import pickle
import numpy as np
# from advance_book import book_slot

app = Flask(__name__)

width, height = 107, 48
cap = cv2.VideoCapture("D:/sem-6/carPark.mp4")
with open('CarParkPos', 'rb') as f:
    posList = pickle.load(f)

# try:
#     with open('Vccant', 'r b') as f:
#         freespace = pickle.load(f)
# except:
#     freespace = []

def generate_frames():
    while True:
        success, img = cap.read()
        if not success:
            break

        imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        imgBlur = cv2.GaussianBlur(imgGray, (3, 3), 1)
        imgThreshold = cv2.adaptiveThreshold(imgBlur, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY_INV, 25, 16)
        imgMedian = cv2.medianBlur(imgThreshold, 5)
        kernal = np.ones((3, 3), np.uint8)
        imDilate = cv2.dilate(imgMedian, kernal, iterations=1)
        chekParkingSpace(imDilate, img)

        ret, buffer = cv2.imencode('.jpg', img)
        frame = buffer.tobytes()
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n')

def chekParkingSpace(imgPro, img):
    spaceCounter = 0
    vccantCounter = 0
    for pos in posList:
        x, y = pos
        imgcrop = imgPro[y:y + height, x:x + width]
        count = cv2.countNonZero(imgcrop)
        # vccantCounter = len(freespace)
        # list = []
        # bool_val, list = book_slot(vccantCounter, list)
        # if count < 900 :
        #     color = (255, 255, 0)
        #     thickness = 3
        #     spaceCounter -= 1
        #     # if pos in freespace:
        #     #     freespace.remove(pos)
        if count < 900:
            # freespace.append(pos)
            color = (0, 255, 0)
            thickness = 4
            spaceCounter += 1
        else:
            color = (0, 0, 255)
            thickness = 2

        # with open('Vccant', 'wb') as f:
        #     pickle.dump(freespace, f)

        cv2.rectangle(img, pos, (pos[0] + width, pos[1] + height), color, thickness)

    cv2.putText(img, f'Free: {(spaceCounter)}/{len(posList)}', (100, 58), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 200, 0), 4)
@app.route('/videofeed')
def video_feed():
    return Response(generate_frames(), mimetype='multipart/x-mixed-replace; boundary=frame')


if __name__ == "__main__":
    app.run(host='localhost', port=5000, debug=True)
