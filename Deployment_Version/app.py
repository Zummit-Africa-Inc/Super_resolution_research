import uvicorn
from fastapi import FastAPI, File, UploadFile, Response
from fastapi.responses import StreamingResponse, FileResponse
import numpy as np
import io
from PIL import Image
from ISR.models import RDN
import cv2

app = FastAPI()

def load_image_into_numpy_array(data):
    return np.array(Image.open(io.BytesIO(data)))
    


rdn = RDN(weights='noise-cancel')



@app.post("/")
async def root(file: UploadFile = File(...)):

    # image = load_image_into_numpy_array(await file.read())

    contents = io.BytesIO(await file.read())
    file_bytes = np.asarray(bytearray(contents.read()), dtype=np.uint8)
    img = cv2.imdecode(file_bytes, cv2.IMREAD_COLOR)

    sr_img = rdn.predict(img, by_patch_of_size=300)
    # Image.fromarray(sr_img)
    res, im_png = cv2.imencode(".png", sr_img)

    return StreamingResponse(io.BytesIO(im_png.tobytes()), media_type="image/png")

