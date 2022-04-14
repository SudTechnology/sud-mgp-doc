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

gitbook build

rm -f ./_book/build.sh

cd ./_book
zip -r ${OUTPUT_FILE_NAME}.zip ./

cd ..
mv ./_book/${OUTPUT_FILE_NAME}.zip "${OUTPUT_DIR_PATH}"/archives

rm -rf ./_book


