import React from 'react';
import { Link } from 'react-router-dom';
import { url } from '../../../util';

const PrivacyPolicy = () => {
    return (
        <div>
            <nav className="navbar navbar-expand-lg navbar-light bg-white py-0 px-2" id="header">
                <div className="container-fluid">
                    <Link className="navbar-brand fw-bold my-text-primary" to="#">
                        <img src={`${url()}img/logo.png`} alt="logo" style={{ width: 60 }} />
                    </Link>
                    <button
                        className="navbar-toggler"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                    >
                        <span className="navbar-toggler-icon"></span>
                    </button>
                    <div className="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul className="navbar-nav ms-auto me-2 mb-2 mb-lg-0">
                            <li className="nav-item">
                                <Link className="nav-link mx-md-3 active" to="/">
                                    Home
                                </Link>
                            </li>
                            <li className="nav-item">
                                <Link className="nav-link mx-md-3 active" to="/#our-services">
                                    Our Services
                                </Link>
                            </li>
                            <li className="nav-item">
                                <Link className="nav-link mx-md-3" to="/#how-it-works">
                                    How it Works
                                </Link>
                            </li>
                            <li className="nav-item">
                                <Link className="nav-link mx-md-3" to="terms-and-condition">
                                    Terms and Condition
                                </Link>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <main>
                <section className="py-5 bg-light mb-5">
                    <h1 className="text-4xl fw-bold text-center lg:text-5xl">Privacy Policy</h1>
                </section>
                <div className="container fw-normal lh-lg fs-5">
                    <div className="">
                        <div>
                            This Privacy Policy describes your privacy rights regarding how and when we collect, use, store, share and
                            protect your information across our websites, APIs, app, email notifications and tools regardless of how you use
                            or access them.
                        </div>

                        <div>
                            When this policy mentions <span className="font-semibold">"we"</span>, <span className="font-semibold">"us"</span>, or{' '}
                            <span className="font-semibold">"our"</span>, it refers to the controller of your information under this policy. The
                            data controller responsible for your information is Aimtoget Technology Limited.
                        </div>

                        <div>
                            Despite this, you alone control and are responsible for any and every information provided to us through the use
                            of our services as provided in the Terms of Service.
                        </div>

                        <div>
                            When using any of our services, you consent to the collection, transfer, storage, disclosure, and use of your
                            information.
                        </div>

                        <div>
                            We respect the privacy of our online visitors and registered users and we will take reasonable steps to protect
                            your information.
                        </div>

                        <div>
                            It is our policy to respect your privacy regarding any information we may collect while operating our website
                            and app.
                        </div>
                    </div>

                    <div className="mt-6 space-y-10">
                        <div>
                            <h4 className="my-3 text-lg fw-bold underline">What We Do to Information Collected</h4>

                            <p></p>
                            <div className="fw-bold">Personal Information</div>
                            <div className="mt-2 text-gray-800">
                                Upon registration, we collect personal information which you voluntarily provided by lawful means. We
                                collect and use personal information solely for fulfilling the purposes specified by us and for other
                                ancillary purposes. <br />
                                <br />
                                This refers to the personal information you submit when you register (e.g., email address, company name,
                                password, bank account number, etc.) it may also include anonymous information that is linked to you, for
                                example, your IP Address. It should be relevant to the purposes for which it is to be used, and, to the
                                extent necessary for those purposes, should be accurate, complete, and up-to-date.
                            </div>
                            <div className="mt-3">
                                <div className="fw-bold">
                                    The following lists what we use your personal information for. These may be updated from time to time.
                                </div>
                                <ul className="mt-1 ml-5 list-disc list-outside">
                                    <li>To provide you with access to our service.</li>
                                    <li>To verify the information provided.</li>
                                    <li>To prevent, detect and manage any illegal and fraudulent activity.</li>
                                    <li>To improve our services to you.</li>
                                    <li>To address any inappropriate use of our services.</li>
                                    <li>To update our website layout, database and content.</li>
                                    <li>To target advertisements, newsletter and service updates.</li>
                                    <li>Resolve disputes that may occur.</li>
                                </ul>
                            </div>
                            <div className="mt-3 space-y-2">
                                <div>
                                    Additional personal information may be gotten from third party applications and other
                                    identification/verification services. For example, from your financial institution.
                                </div>
                                <div>
                                    Once you begin to use our services, we keep all records of your transactions and we will not share or
                                    disclose your personal information with a third party without your consent.
                                </div>
                            </div>
                            <p></p>
                        </div>

                        <div>
                            <p></p>
                            <div className="fw-bold">Protecting Your Information</div>
                            <div className="mt-1 space-y-2 text-gray-800">
                                <div>
                                    We will protect your personal information by using global security safeguards against loss or theft, as
                                    well as against any unauthorized access, risk of loss, disclosure, copying, misuse or modification.
                                </div>
                                <div>
                                    Other security measures include but not limited to, firewall, data encryption and granting access only
                                    to employees in order to fulfil their job responsibilities. <br />
                                </div>
                                <div>
                                    We are committed to conducting our business in accordance with these principles in order to ensure that
                                    the confidentiality of personal information is protected and maintained.
                                </div>
                            </div>
                            <p></p>
                        </div>
                        <div>
                            <p></p>
                            <div className="fw-bold">Cookies</div>
                            <div className="mt-1 space-y-2 text-gray-800">
                                <div>
                                    Like many other websites, we use cookies to identify you as a user and to customize and improve our
                                    services. A cookie is a small data file that is transferred to your computer or mobile device. It
                                    enables us to remember your account log-in information, IP addresses, web traffic, number of times you
                                    visit, date and time of visits.
                                </div>
                                <div>
                                    Some browsers may automatically accept cookies while some can be modified to decline cookies or alert
                                    you when a website wants to place a cookie on your computer. If you do choose to disable cookies, it may
                                    limit your ability to use our website.
                                </div>
                            </div>
                            <p></p>
                        </div>
                        <div>
                            <p></p>
                            <div className="fw-bold">Data Storage</div>
                            <div className="mt-2 text-gray-800">
                                We will only retain personal information on our servers for as long as an account is active. Once an account
                                has been deactivated, your information is stored on our servers for as long as necessarily obligated by law.
                            </div>
                            <p></p>
                        </div>
                        <div>This policy may change from time to time at our sole discretion.</div>
                        <div>Last updated: 1st June, 2019</div>
                    </div>
                </div>
            </main>
        </div>
    );
};

export default PrivacyPolicy;
