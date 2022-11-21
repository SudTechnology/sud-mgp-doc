#! /bin/sh -e

export CurDir=$(dirname "$0")

cd $CurDir

echo $CurDir

export BuildType="$1"

export OUTPUT_FILE_NAME=SudMGP-doc
export OUTPUT_DIR_PATH=$CurDir/Products

rm -rf $CurDir/Products

if [ ! -e "${OUTPUT_DIR_PATH}"/archives ]; then
  mkdir -p "${OUTPUT_DIR_PATH}"/archives
fi

gitbook build ./ ./build

rm -f ./build/build.sh

cd ./build
zip -r ${OUTPUT_FILE_NAME}.zip ./

cd ..
mv ./build/${OUTPUT_FILE_NAME}.zip "${OUTPUT_DIR_PATH}"/archives

rm -rf ./build

const array = []
for(let i = 0; i <= 50; i++) {
  if(i % 2 === 0) {
    array.push(i)
  }
}

