(function () {

    app(function (api) {

        api.on("load:detail", function (path) {

            var result = path.split("/")[1] && api.searchResults[path.split("/")[1]],
                tmpl = $("#tmpl-detail").innerHTML.trim();

            $("#detail section").innerHTML = riot.render(tmpl, {
                name: result.fileinfo.name,
                path: result.fileinfo.path,
                size: result.file.size ? Math.round(result.file.size / 1000) + " KB" : "Unknown",
                modified: result.file.lastModifiedDate ? result.file.lastModifiedDate.toDateString() : "Unknown",
                icontype: api.iconclass(result.file.type),
                i: path.split("/")[1],
                shareorpickid: api.activityRequest ? "pick" : "share",
                shareorpickclass: api.activityRequest ? "ok-circled" : "share"
            });

            // Preview button handler
            $("#previewbtn") && $("#previewbtn").addEventListener("touchend", function (e) {
                e.preventDefault();

                var result = api.searchResults[e.target.dataset.index];

                var activity = new MozActivity({
                    name: result.file.type === "application/pdf" ? "view" : "open",
                    data: {
                        type: result.file.type,
                        blob: result.file
                    }
                });

                activity.onerror = function () {
                    alert("Cannot preview this file.");
                };

                // Memory cleanup
                result = null;

            }, false);

            // Share button handler
            $("#sharebtn") && $("#sharebtn").addEventListener("touchend", function (e) {
                e.preventDefault();

                var result = api.searchResults[e.target.dataset.index];

                var data = { blobs: [result.file], number: 1 };

                if (result.file.type.indexOf("image") === 0) {
                    data.type = "image/*";
                }

                var activity = new MozActivity({
                    name: "share",
                    data: data
                });

                // Memory cleanup
                result = data = null;

            }, false);

            // Pick button handler
            $("#pickbtn") && $("#pickbtn").addEventListener("touchend", function (e) {
                e.preventDefault();

                var result = api.searchResults[e.target.dataset.index];

                if (api.activityRequest.source.name === "pick") {
                    api.activityRequest.postResult({
                        type: result.file.type,
                        blob: result.file
                    });
                }

                // Memory cleanup
                result = null;

            }, false);

            // Memory cleanup
            result = tmpl = null;

        });

    });

})();
