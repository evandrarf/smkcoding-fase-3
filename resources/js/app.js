import { createApp, h } from "vue";
import { createInertiaApp, Link, Head } from "@inertiajs/inertia-vue3";
import { InertiaProgress } from "@inertiajs/progress";
import "../css/app.css";

import route from "ziggy-js";

import Notifications from "notiwind";
import { library } from "@fortawesome/fontawesome-svg-core";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { fas } from "@fortawesome/free-solid-svg-icons";
library.add(fas);
import { fab } from "@fortawesome/free-brands-svg-icons";
library.add(fab);
import { far } from "@fortawesome/free-regular-svg-icons";
library.add(far);
import { dom } from "@fortawesome/fontawesome-svg-core";
dom.watch();

import VueDatePicker from "@vuepic/vue-datepicker";
import "@vuepic/vue-datepicker/dist/main.css";

createInertiaApp({
    resolve: async (name) => {
        const pages = import.meta.glob("./pages/**/*.vue");
        return (await pages[`./pages/${name}.vue`]()).default;
    },
    setup({ el, App, props, plugin }) {
        createApp({ render: () => h(App, props) })
            .mixin({ methods: { route } })
            .use(plugin)
            .use(Notifications)
            .component("Link", Link)
            .component("Head", Head)
            .component("font-awesome-icon", FontAwesomeIcon)
            .component("VueDatePicker", VueDatePicker)
            .mount(el);
    },
});
InertiaProgress.init();
