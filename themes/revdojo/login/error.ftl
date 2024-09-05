<#import "template.ftl" as layout>
    <@layout.registrationLayout displayMessage=false; section>
        <#if section="header">
            <#elseif section="form">
                <style>
                /* Full-screen overlay */
                .overlay {
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background-color: white;
                    /* Transparent black overlay */
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    z-index: 1000;
                    /* Make sure it overlays everything */
                }

                /* Loading content in the center */
                .loading-content {
                    text-align: center;
                    color: white;
                }

                /* Bounce and scale animation for the image */
                .animate-bounce {
                    animation: bounce 2s infinite, scale 2s infinite;
                }

                @keyframes bounce {

                    0%,
                    100% {
                        transform: translateY(0);
                    }

                    50% {
                        transform: translateY(-10px);
                    }
                }

                @keyframes scale {

                    0%,
                    100% {
                        transform: scale(1);
                    }

                    50% {
                        transform: scale(1.05);
                    }
                }

                /* Message styling */
                .loading-message {
                    color: black;
                    margin-top: 10px;
                    font-size: 16px;
                }
                </style>
                <!-- Full-screen overlay with animated logo and message -->
                <div class="overlay">
                    <div class="loading-content">
                        <img
                            class="animate-bounce"
                            width="150"
                            src="https://lms-v3.s3.amazonaws.com/default_logo_revdojo.png"
                            alt="RevDojo" />
                        <p class="loading-message">Please wait...</p>
                    </div>
                </div>
                <div id="kc-info-message">
                    <p><a id="backToApplication" href="${msg('baseUrl')}">
                            ${kcSanitize(msg("backToApplication"))?no_esc}
                        </a></p>
                    <#if skipLink??>
                        <#else>
                            <#if pageRedirectUri??>
                                <p><a id="backToApplication" href="${client.baseUrl}">
                                        ${kcSanitize(msg("backToApplication"))?no_esc}
                                    </a></p>
                                <#elseif actionUri??>
                                    <p><a id="backToApplication" href="${client.baseUrl}">
                                            ${kcSanitize(msg("backToApplication"))?no_esc}
                                        </a></p>
                            </#if>
                    </#if>
                </div>
        </#if>
    </@layout.registrationLayout>
    <script>
    // Search for the proceed-link on the page. If it exists click it to automate the step
    window.onload = function() {
        var proceedLink = document.getElementById("backToApplication");
        if (proceedLink) {
            proceedLink.click();
        }
    }
    </script>