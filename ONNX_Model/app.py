import os
import uvicorn
from fastapi import FastAPI, File, UploadFile, Response
from fastapi.responses import StreamingResponse, FileResponse
import numpy as np
import io
from PIL import Image
import cv2
from ISR.models import RDN
import warnings
import onnxruntime 
warnings.filterwarnings("ignore", category=UserWarning, message=".*?Your .*? set is empty.*?")

app = FastAPI()



@app.get('/')
def home():
    return {'Title': 'Super Resolution and Colorisation API'}


# endpoint for just enhancing the image
@app.post("/enhance")
async def root(file: UploadFile = File(...)):
    

    contents = io.BytesIO(await file.read())
    file_bytes = np.asarray(bytearray(contents.read()), dtype=np.uint8)
    x = np.array(file_bytes,dtype=np.float) 
    x = np.expand_dims(x, (1, 2))
    
    sess = onnxruntime.InferenceSession("/content/model.onnx")
    x = x if isinstance(x, list) else [x]
    feed = dict([(input.name, x[n]) for n, input in enumerate(sess.get_inputs())])
    pred_onnx = sess.run(None,  feed)[0]
    pred = np.squeeze(pred_onnx)
    pred_img = Image.fromarray((pred * 1).astype(np.uint8)).convert('RGB')
    res, im_png = cv2.imencode(".png", pred_img)
    return StreamingResponse(io.BytesIO(im_png.tobytes()), media_type="image/png")

    #contents = io.BytesIO(await file.read())
    #file_bytes = np.asarray(bytearray(contents.read()), dtype=np.uint8)
    #img = cv2.imdecode(file_bytes, cv2.IMREAD_COLOR)

    #sr_img = rdn.predict(img, by_patch_of_size=300)

    #res, im_png = cv2.imencode(".png", sr_img)

    

