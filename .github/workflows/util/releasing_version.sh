if [[ $RELEASE_TYPE == "patch" ]]
then
    VERSION_TO_RELEASE=v$(./.github/workflows/util/semver bump $RELEASE_TYPE $CURRENT_VERSION)
elif [[ $RELEASE_TYPE == "minor" ]] || [[ $RELEASE_TYPE == "major" ]]
then 
    VERSION_TO_RELEASE=v$(./.github/workflows/util/semver bump release $CURRENT_VERSION)
elif [[ $RELEASE_TYPE == *"snapshot"* ]]
then
    VERSION_TO_RELEASE=v$(./.github/workflows/util/semver bump prerel $RELEASE_TYPE $CURRENT_VERSION)
elif [[ $RELEASE_TYPE == "edge" ]]
then
    VERSION_TO_RELEASE=latest
fi

echo $VERSION_TO_RELEASE